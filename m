Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18327565180
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 12:00:10 +0200 (CEST)
Received: from localhost ([::1]:60658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8IsD-0000Uq-5H
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 06:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8IWL-0005P4-8H
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:37:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8IW4-0005VM-E3
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:37:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656927435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ekZPHMg/tXAWjPagKNk966F3hzwjo6JI4NFZ5pJ+Wc4=;
 b=AMT38nqurKcyljzSZAuMviTHVJcSKQy+zMHTOMPKlYXxFJY0fR9DtxAFM2AGl0C5lRJUrG
 Mm/FmbKxRGi2fkg9L1xwBgGEorWzrNmuL5XIFkflo3h5omPgwrP+IkKAoCtSaQh6rR4Ana
 xNZVzHUflHiHHu3ck19MoM2aRPUYmaw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-VaEAQ0x6PkKnWegH4QBVJA-1; Mon, 04 Jul 2022 05:37:14 -0400
X-MC-Unique: VaEAQ0x6PkKnWegH4QBVJA-1
Received: by mail-wr1-f72.google.com with SMTP id
 k26-20020adfb35a000000b0021d6c3b9363so456852wrd.1
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=ekZPHMg/tXAWjPagKNk966F3hzwjo6JI4NFZ5pJ+Wc4=;
 b=KPPBBnJfO8LFgTDDzRT2TjBn/Nh8KoXTvRQsVB3E1g3a59jhYFllUiZZ3C4Wu/iAqs
 5gsD3cqVqeAHNJ/kcALti6okGW/hcsEkGUgioVni4R5mNNZuSDUb+5Ye/QY57GszPW9B
 dwaMu/ukBoNm0maPscxEg2AhhW5uZYn6Pw3e1peW0v+fx/gWHd/bGxxTUN22ral7gmAf
 sXqfu9LCr8quMRKnlc82RorNGGdvFH4yTZjiQ83gB/kVo3Jf9CYP9gDtW02cZTW09MSh
 J+8FZY+X92ztA9z94nU0zHtCToWkyy7f6JuyMntiEmJYQtG+BJIHBXnesA6NQHg3qvuN
 rV7w==
X-Gm-Message-State: AJIora/2YHD/AyXZvn3hDZgwqDwvuKflUvNtj8oGI5ItuCrQ1uKWUctC
 7k/Y2qB2ZY+TCI3Ecp6MMB9e2mwZgEm7REKt5jdUAQlnudj/bOA6PWhk8n/3FHLwEdBIN8sxQp+
 VMZrzbU4hHR7rwno=
X-Received: by 2002:a05:600c:1908:b0:3a0:998c:313d with SMTP id
 j8-20020a05600c190800b003a0998c313dmr30271245wmq.19.1656927433284; 
 Mon, 04 Jul 2022 02:37:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sthTL99RMZkOryZ7vMGQdnOPoGmHrjNqQCav46u4XKP0YgL5zF9aO1VUejpsHj7Te15LxCYg==
X-Received: by 2002:a05:600c:1908:b0:3a0:998c:313d with SMTP id
 j8-20020a05600c190800b003a0998c313dmr30271210wmq.19.1656927433085; 
 Mon, 04 Jul 2022 02:37:13 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-178-243.web.vodafone.de.
 [109.43.178.243]) by smtp.gmail.com with ESMTPSA id
 u6-20020a5d5146000000b0020fcc655e4asm30291841wrt.5.2022.07.04.02.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 02:37:12 -0700 (PDT)
Message-ID: <aacf7432-6f0b-b8f7-bdc4-116e3873543c@redhat.com>
Date: Mon, 4 Jul 2022 11:37:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi
 <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Brad Smith <brad@comstyle.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>
References: <20220704064254.18187-1-thuth@redhat.com>
 <20220704064254.18187-2-thuth@redhat.com>
 <CAJSP0QUx8456jPp4=MOjRwZMPrBYgU1669HnEpC_+gDobhOiCQ@mail.gmail.com>
 <YsKvalrPIO96wWuP@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/3] scripts/make-release: Do not include the edk2 sources
 in the tarball anymore
In-Reply-To: <YsKvalrPIO96wWuP@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 04/07/2022 11.14, Daniel P. Berrangé wrote:
> On Mon, Jul 04, 2022 at 08:26:34AM +0100, Stefan Hajnoczi wrote:
>> On Mon, 4 Jul 2022 at 07:45, Thomas Huth <thuth@redhat.com> wrote:
...
>>> +cat > sources.txt <<EOF
>>> +The edk2 sources can be downloaded from:
>>> +
>>> +https://github.com/tianocore/edk2/archive/${edk2rev}.tar.gz
>>
>> Please use QEMU's edk2 mirror:
>> https://gitlab.com/qemu-project/edk2
>>
>> QEMU mirrors all dependencies so that even if upstream projects go
>> offline we can still rebuild all of QEMU from source.
> 
> Note that the github/lab generated tarballs are not signed, while
> QEMU's release tarballs are gpg signed, so from that POV this would
> be a regression no matter which site we point to.

Maybe we should point to the edk2 release page instead? I.e.:

  https://github.com/tianocore/edk2/releases

Anyway, it's IMHO certainly not *our* job to provide signed edk2 sources here.

> Also it would need more guidance on what to actually do with the
> tarball, as if you merely unpack it into this dir, it won't work
> as it will be one level of dirs nesting too deep for QEMU's
> build scripts to work.

I could add some wording how to use the edk2-build.sh script with a 
downloaded edk2 tarball if that helps ... not sure whether it is really 
required, though, we also don't provide instruction for building any other 
firmware yet, as far as I know.

  Thomas


