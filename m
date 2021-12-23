Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5221347E151
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 11:21:17 +0100 (CET)
Received: from localhost ([::1]:34344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0LDo-0007G4-FS
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 05:21:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0LBI-0004rr-3b
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 05:18:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0LBG-0007XA-Ns
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 05:18:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640254718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=agxEPlQqLF5z3prp+ntLAHbmxbQSsbIL0QQVNCihRzY=;
 b=VVN0gP9gD7Uo4H6rcx/bRWL9V2E5Ia9AXCNlOWcPUDNx5kWOtQI3h+oQSQiZMItdXDfHa3
 OfGvdSInAcKk9jLYsqiKOOTgyFA2BjPmfHv76mn8rBxCVUJTaBFBLRGSpfauyoXjcNoYBU
 V7Ie6nH1DgTNAR1mnZGj7UhjUtyHEI0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-TJb_bu7IPiWx2ylLAfl7Tg-1; Thu, 23 Dec 2021 05:18:35 -0500
X-MC-Unique: TJb_bu7IPiWx2ylLAfl7Tg-1
Received: by mail-wr1-f72.google.com with SMTP id
 j26-20020adfb31a000000b001a2356afd4fso1172137wrd.21
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 02:18:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=agxEPlQqLF5z3prp+ntLAHbmxbQSsbIL0QQVNCihRzY=;
 b=lbR26prObRgv0ZNoYxgjvpaLx0NIpqmxB8Y8muu3aLT04HZp6BTRJBH7lw21A/AjA1
 HjekAuxyD1X1sNp5xXsDURGl9usebfuoUsdPKJRFHnkzyaTr+N9YbIruaFH5O6gB+B9Y
 syWjLYRcSBPAbWA1335Vz/5kI7ZLLxhnbtiUKv+r7xl6c+4D68O2rSQNBjqjDQCr5EIY
 AZ5zCG/oXgjEUtrMX1l7F8XOxjGwWOQ/JlR8CNcDPGKpGY9aQXT/0qckTt55+aKGFdwX
 p3IQFVFR0+NRCwUm61rp1sR/nFDGLJ7/41My0mV4RFvPeFrImgVrXug1OlIBuoFgdaAQ
 GNqw==
X-Gm-Message-State: AOAM531+BVR0QL5SgITswPioNMHrI/WiMUSMp9sUvDHX+mJ5tnAY4N2T
 1JFP1Ga8Ch9Zvt+rR1R10CMCU6JfzfjTiPK+hBfpM+U3iDmGVk0K6TGazgfEicmgu9f/1nJR1/4
 cCOcyLEtTiM984Q4=
X-Received: by 2002:adf:9d8c:: with SMTP id p12mr1232916wre.622.1640254713742; 
 Thu, 23 Dec 2021 02:18:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvJh+Ib+4wdUPK+bgP1xyiVKvgHRhFZwG6T4lwEoyS7S3pce5Guzd/CrAjjTFVWWAQE3v+4A==
X-Received: by 2002:adf:9d8c:: with SMTP id p12mr1232905wre.622.1640254713603; 
 Thu, 23 Dec 2021 02:18:33 -0800 (PST)
Received: from [192.168.43.238] (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id b2sm5540999wrd.35.2021.12.23.02.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 02:18:33 -0800 (PST)
Message-ID: <c6754075-8b8a-3ee9-147c-ac5b99695728@redhat.com>
Date: Thu, 23 Dec 2021 11:18:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/3] block: print the server key type and fingerprint on
 failure
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211118143547.2045554-1-berrange@redhat.com>
 <20211118143547.2045554-4-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211118143547.2045554-4-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.264, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/21 15:35, Daniel P. Berrangé wrote:
> When validating the server key fingerprint fails, it is difficult for
> the user to know what they got wrong. The fingerprint accepted by QEMU
> is received in a different format than openssh displays. There can also
> be keys for multiple different ciphers in known_hosts. It may not be
> obvious which cipher QEMU will use and whether it will be the same
> as openssh. Address this by printing the server key type and its

"OpenSSH"? (twice)

> corresponding fingerprint in the format QEMU accepts.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  block/ssh.c | 37 ++++++++++++++++++++++++++++++-------
>  1 file changed, 30 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


