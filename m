Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 880B557B920
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 17:04:28 +0200 (CEST)
Received: from localhost ([::1]:45202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEBFT-00077e-1L
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 11:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEBCl-0003hU-O4
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:01:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEBCh-0001BT-QX
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:01:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658329294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1arCLYwb2eDLWnAoD3w3EWOpYjUFPu5xujtmutryRO0=;
 b=LJc2JmBz7R/cMjJIXnJzk0LsZZuq7+xddqQkGX8rf1ZXmmrpp+v3Onn9etf+2BNTV0iBcB
 vvR7mlir0ROzKkGzfXLgdPoCgbwoKnk9ChauGgr38T15c5owXnJhGS5T8GhugnVU/Zgwuo
 ndtBZ/XOv9CyHHOFIHys+Af4cftH6RU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-j3xUMRRlO1KHiAPM7XBiuQ-1; Wed, 20 Jul 2022 11:01:33 -0400
X-MC-Unique: j3xUMRRlO1KHiAPM7XBiuQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg6-20020a05600c3c8600b003a03d5d19e4so896828wmb.1
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 08:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=1arCLYwb2eDLWnAoD3w3EWOpYjUFPu5xujtmutryRO0=;
 b=2wrUJA0OHaMInozmX2tf9ROMsziXGmnjkp1ZW5cSq44Kyxnq1ZklIADkuKVR13ouE7
 p/Qd7qqNgUEveoBWpLWecjv62ygABOOK0YElXJVd0TA1pnIa7iYn7dV0XID5vXzEQd1d
 EGLUHws19EtSX1b3VSFSVol4Oys+4r83arRgUVlkJnTpWiaP4qB8JDEic7dh6mKj+PUG
 HYgrP0sKQZXvdJiB9LUntCqhl1uqYeNzbGdi+bAIcyPDu+AoDcPU0FXt5/roVZenudNU
 xV27+3Cl5+8ev/lCO5JckKzm7Jqtam4EwHTrC7LP3R7b5hgQ6ZAIevG3v+veTKunoPF8
 pCGQ==
X-Gm-Message-State: AJIora9NvFI/vHvsoc5kn4JpfKniUOL7+UcEMTDn39xd5EKRoTlksQfZ
 X8uBg+T7ThpfB/oW/aQHZbFS54MlMQH+T+tBOO1WzeY7kdpTT5mNl8ixVmAYZIttxgydCzSQSHW
 jDv8ycrZhm6g7rKE=
X-Received: by 2002:a05:600c:a03:b0:39e:4f0c:938c with SMTP id
 z3-20020a05600c0a0300b0039e4f0c938cmr4236516wmp.145.1658329292383; 
 Wed, 20 Jul 2022 08:01:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tUrmcFGGoGbevmHEIDIa5i93aaN0i92bpA795lKidb89WECQ4O+dKV52UAm+0bWaTYn0Tx3A==
X-Received: by 2002:a05:600c:a03:b0:39e:4f0c:938c with SMTP id
 z3-20020a05600c0a0300b0039e4f0c938cmr4236468wmp.145.1658329292044; 
 Wed, 20 Jul 2022 08:01:32 -0700 (PDT)
Received: from [192.168.8.104] (tmo-096-80.customers.d1-online.com.
 [80.187.96.80]) by smtp.gmail.com with ESMTPSA id
 z3-20020a1cf403000000b003a0323463absm2617055wma.45.2022.07.20.08.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 08:01:31 -0700 (PDT)
Message-ID: <103112d1-7a5f-6457-56ae-fed0d6a80646@redhat.com>
Date: Wed, 20 Jul 2022 17:01:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Brad Smith <brad@comstyle.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20220704064254.18187-1-thuth@redhat.com>
 <20220704064254.18187-2-thuth@redhat.com>
 <CAJSP0QUx8456jPp4=MOjRwZMPrBYgU1669HnEpC_+gDobhOiCQ@mail.gmail.com>
 <YsKvalrPIO96wWuP@redhat.com>
 <aacf7432-6f0b-b8f7-bdc4-116e3873543c@redhat.com>
 <YsLEz8Qj3QmaISxF@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/3] scripts/make-release: Do not include the edk2 sources
 in the tarball anymore
In-Reply-To: <YsLEz8Qj3QmaISxF@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 04/07/2022 12.45, Daniel P. Berrangé wrote:
> On Mon, Jul 04, 2022 at 11:37:11AM +0200, Thomas Huth wrote:
>> On 04/07/2022 11.14, Daniel P. Berrangé wrote:
>>> On Mon, Jul 04, 2022 at 08:26:34AM +0100, Stefan Hajnoczi wrote:
>>>> On Mon, 4 Jul 2022 at 07:45, Thomas Huth <thuth@redhat.com> wrote:
>> ...
>>>>> +cat > sources.txt <<EOF
>>>>> +The edk2 sources can be downloaded from:
>>>>> +
>>>>> +https://github.com/tianocore/edk2/archive/${edk2rev}.tar.gz
>>>>
>>>> Please use QEMU's edk2 mirror:
>>>> https://gitlab.com/qemu-project/edk2
>>>>
>>>> QEMU mirrors all dependencies so that even if upstream projects go
>>>> offline we can still rebuild all of QEMU from source.
>>>
>>> Note that the github/lab generated tarballs are not signed, while
>>> QEMU's release tarballs are gpg signed, so from that POV this would
>>> be a regression no matter which site we point to.
>>
>> Maybe we should point to the edk2 release page instead? I.e.:
>>
>>   https://github.com/tianocore/edk2/releases
>>
>> Anyway, it's IMHO certainly not *our* job to provide signed edk2 sources here.
>>
>>> Also it would need more guidance on what to actually do with the
>>> tarball, as if you merely unpack it into this dir, it won't work
>>> as it will be one level of dirs nesting too deep for QEMU's
>>> build scripts to work.
>>
>> I could add some wording how to use the edk2-build.sh script with a
>> downloaded edk2 tarball if that helps ... not sure whether it is really
>> required, though, we also don't provide instruction for building any other
>> firmware yet, as far as I know.
> 
> Well my thought is that currently you can do  'make -C roms efi' from
> the unpacked release tarball, and with this change, that no longer
> works. So we ought to explain what to do to get that working again.
> 
> This doesn't neccessarily means docs. It could just be 'make' prints
> out an error telling people what to do, or figure it out itself.
> 
> If we split off the entire of the 'roms' directory into a self-contained
> firmware-src tarball, the 'roms/Makefile' would still "just work".

Sorry for the late reply, I've been pondering about this for a while and was 
busy with other stuff...

So I think I tend to agree - if we still want to ship the edk2 (and skiboot) 
sources, it's likely best if we put all roms/* sources into a separate 
tarball. Maybe even split the roms folder into a separate git repository.

However, there's at least one minor obstacle: The sources of the s390-ccw 
bios (in pc-bios/s390-ccw) currently partly depend on the roms/SLOF sources 
to be available for the full build. So if we slice out the roms/SLOF stuff, 
we should likely move the s390-ccw bios also to same location...

I guess it's now too late for 7.1, so I'll postpone my further work on this 
to the 7.2 release cycle.

  Thomas


