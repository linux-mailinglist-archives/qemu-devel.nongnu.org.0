Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B429848239B
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 12:22:18 +0100 (CET)
Received: from localhost ([::1]:47704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3FzF-0003ta-By
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 06:22:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3FxR-0002s1-4x
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 06:20:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3FxO-0005X6-CL
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 06:20:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640949621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=u16yzgDlFIQftTjnLGU97/21t35iJ1HZCuJwRAUcqeg=;
 b=Qo41olNX5mlhEifWaICeDZIcy42cXZwLLtof7F5O0cb3qRgxUgchWlSO6szI4pmfPnbAdf
 wBGj60Wja3ugfhpTLo1Fl0hAyeggoWcMGsFLIlrkBVIrHa4bZe8GCDAeHLq3cpsGQPsC/b
 1cLiQMfynrrKEPfzgTdbZ/d/rMgjC+E=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-REvNzXlyN36i4AtSFG_UCw-1; Fri, 31 Dec 2021 06:20:20 -0500
X-MC-Unique: REvNzXlyN36i4AtSFG_UCw-1
Received: by mail-ed1-f69.google.com with SMTP id
 y10-20020a056402358a00b003f88b132849so18939814edc.0
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 03:20:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=u16yzgDlFIQftTjnLGU97/21t35iJ1HZCuJwRAUcqeg=;
 b=y8axLPUDnzz0LjLD/wMp95laW6xFMffial5DDVpJYEjrW9+thHnUY1YBrNrfiG14BK
 eCPsHg5hOxYxoE/UrMED4iapKLxu+6tXifbP6NW7poIuuRisxYTZGMj6m+c7K48wB0W6
 N1fs9xIDCtPs0Kr5mB/bsHP86FbvTWas1IntLWzCjXexEKg7ReVSqjcUsXOoGDjYcE85
 s9+BWp7oG87QTRroyh5N4XdFA5dVhN3huKd5NQ3JMJRfM6Hdtzv+l71o298y8kvex/M/
 tPERrZBxxeT4h2zmFFxlVAj1mWF1kMbL4rsvFUA080DOsQWsLIVobjeOYrmiBniCAmGD
 IW3w==
X-Gm-Message-State: AOAM531PEYU0uUrcf9Lw6uPaB6ZzLhSaXQ1jTbJZaZmMvgI6j2ACOlt0
 4BGMqYtCwRwEsevSB81C6/nc4sWdZZKHBRV4G+lUkxRGHO6UNWf7Ea+ggwtrvFRGj3eBnIT+HCZ
 choeyLoLVkmrDUa8XhGi//N0aIUfPBETTDV6KTAQsfmXg+43ePvltMsvGWvdZdLVk
X-Received: by 2002:a17:906:4317:: with SMTP id
 j23mr27934495ejm.748.1640949618826; 
 Fri, 31 Dec 2021 03:20:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBcGgunbn7wDRgH6uO7cRqb8qYyX2hw2JhefkT8wY0bo/qqvmoB9S8ik2AiMY4k/jKsrpQXg==
X-Received: by 2002:a17:906:4317:: with SMTP id
 j23mr27934480ejm.748.1640949618484; 
 Fri, 31 Dec 2021 03:20:18 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id 12sm8573161ejh.173.2021.12.31.03.20.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 03:20:17 -0800 (PST)
Message-ID: <2ce6f1cb-5fb0-5515-4040-3367d98d1919@redhat.com>
Date: Fri, 31 Dec 2021 12:20:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: qemu-devel <qemu-devel@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: Thoughts on CONFIG_TOOLS & CONFIG_USER_ONLY
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

The CONFIG_USER_ONLY definition allows limiting user-mode
code to user emulation (in contrast to system emulation).
We often use it in common code.

Often the negative form (to *exclude* user-mode) is used.
This works fine with system emulation in mind, but it could
introduce subtle bugs when neither user nor system emulation
are used, for example with tools.

There is a CONFIG_TOOLS definition, but it is not used in C:

  config-host.mak:CONFIG_TOOLS=y
  config-host.h:#define CONFIG_TOOLS 1

Not sure how to clarify / improve, this is a bit confusing.

Just thinking loudly :)

Regards,

Phil.


