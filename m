Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BB954C9A0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 15:19:36 +0200 (CEST)
Received: from localhost ([::1]:50428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Svn-0001j2-60
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 09:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Sp2-0004EC-60
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 09:12:36 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:33838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Sow-0000LU-Kh
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 09:12:35 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 mh16-20020a17090b4ad000b001e8313301f1so3305192pjb.1
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 06:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hogDbEJA7ahdQHS1ITpfegQQ2rEJZW8L53gr2WZZEqw=;
 b=bLspP+EWsgqZuQ2qSnJozjSzb3gefzFhqo8MlJkOpRdodVJtWUQeyrMgc4H+vV/4Ry
 OaZicMtdWueFloxHiZ7MV5+6rN0Jf3vgLkRiX7f/nihcZrRd7DyA/JYZ9yL1jDfiF1vZ
 sIjqISOmXp1F9kISbDNMbju+VTw93tEoFfHVtRlU4Y8BxCrX4ot/z6eOquUC3ljBXAAS
 1SShP1VDwx/zXqRK9lrLedMRG/dzq3oT7iraGHiM1Rs+CSQXziuUHMcoXVUr0wOEwMHv
 +BGrfEF7wrB8WW/PSgi6ormEifkLEaLE0kCMycVO9+UEVeZFDsZQRyCW26TT7AZvRn3X
 ThGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hogDbEJA7ahdQHS1ITpfegQQ2rEJZW8L53gr2WZZEqw=;
 b=U8EEG3R3f2O/cfcau/ZOol6QfD8oRstKGCa9ZlpTPMeD1Vz8gpQEltWNDbWUamtHNN
 dg0C0NCSPVe5CPXA25AxvUmU7w8vJvrN5Uz9IaffB18+RIvoa9nH63lNxTitijIW3pU7
 AJ00kKspwHM6XNGuCWbtiF+XDy5dDyneluxQ/L6x5i2GIvOHwUugvCUfaKf5tD1dCYFj
 geKK5UZaHgT+dps3aBxP969f0kHgjiL35bmMy+I5OsIHgezv4NKzgqQFuQa3awPR2mIG
 HT/kMZ/GQ/VRNXH9f1i9RUpWbwwGwQDYol3sZe1auTecFOXrj0OfwumAUch7vGmsIavB
 YkDQ==
X-Gm-Message-State: AJIora/xpZKAIrr8RXU40xlpG/6BApnyFJ0MCr+5JOHSwGuoy6oWh8ye
 N9LzAU5a8mh8lNdZn7Gmvik=
X-Google-Smtp-Source: AGRyM1uSXLZgFOJW5xjQnDd9i2LYQ7TzyM8oADzStirxgjKj9S6NejJ7bbfqDTCd7cDPtiW4ezEn7A==
X-Received: by 2002:a17:903:1211:b0:168:e42f:86ff with SMTP id
 l17-20020a170903121100b00168e42f86ffmr9368185plh.112.1655298748985; 
 Wed, 15 Jun 2022 06:12:28 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 iy13-20020a170903130d00b0015e8d4eb243sm9268163plb.141.2022.06.15.06.12.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 06:12:28 -0700 (PDT)
Message-ID: <a04a7014-108e-50c7-683d-5092092b63e5@gmail.com>
Date: Wed, 15 Jun 2022 22:12:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 1/4] cutils: Introduce bundle mechanism
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang
 <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20220614210746.78911-1-akihiko.odaki@gmail.com>
 <20220614210746.78911-2-akihiko.odaki@gmail.com>
 <77746ff5-b069-8657-5d64-24d03bca8a75@redhat.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <77746ff5-b069-8657-5d64-24d03bca8a75@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/06/15 17:19, Paolo Bonzini wrote:
> On 6/14/22 23:07, Akihiko Odaki wrote:
>> diff --git a/util/cutils.c b/util/cutils.c
>> index a58bcfd80e7..fe3bbb1c4eb 100644
>> --- a/util/cutils.c
>> +++ b/util/cutils.c
>> @@ -1086,3 +1086,36 @@ char *get_relocated_path(const char *dir)
>>       }
>>       return g_string_free(result, false);
>>   }
>> +
>> +static const char * const bundle_formats[] = {
>> +    "%s" G_DIR_SEPARATOR_S ".." G_DIR_SEPARATOR_S "%s",
>> +    "%s" G_DIR_SEPARATOR_S "qemu-bundle" G_DIR_SEPARATOR_S "%s"
>> +};
> 
> Why do you need both?
> 
> Paolo

The earlier one is used when QEMU is installed. The latter one is used 
in the build tree.

Actually the order was problematic as Daniel pointed out. It is fixed in 
the v5, which I have just sent out.
On 2022/06/15 17:16, Daniel P. Berrangé wrote:
 > This is flawed because it looks at the installed paths first, and
 > falls back to uninstalled paths afterwards. So if you're building
 > and running QEMU 7.1.0 from git, and have QEMU 5.0.0 installed,
 > your QEMU 7.1.0 will end up finding files from the 5.0.0 install.

Regards,
Akihiko Odaki

