Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 347E8434E26
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:42:29 +0200 (CEST)
Received: from localhost ([::1]:55858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdCnU-0003nu-Aa
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mdCfh-0001Z2-8a
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:34:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mdCfb-0006CM-O4
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:34:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634740457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nglcX0K4dpfe62mj1tWzw4Quv+YvNFWc332/GGmfDfI=;
 b=e7Ed3szai6iLJNak0XgbmhmPZKPM3SATZ0I8RIwRv7eTisV71wgg7izo5T4NKRGMa99IPK
 NgKZHGyjjs3HW66Ng+LgAGHQLs2F3JDtdTGA8npI2fEDFYJ4UI6SzQYyWedUrtq86KfAtK
 PRB+zx1ct30eus+JMDA5vDyRKynAZdE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-YLhoOq0YMBqQ7KAlt8QCEg-1; Wed, 20 Oct 2021 10:34:14 -0400
X-MC-Unique: YLhoOq0YMBqQ7KAlt8QCEg-1
Received: by mail-ed1-f71.google.com with SMTP id
 c25-20020a056402143900b003dc19782ea8so17722434edx.3
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 07:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nglcX0K4dpfe62mj1tWzw4Quv+YvNFWc332/GGmfDfI=;
 b=Hyd29HOZKLWtBfc+HKb6Z0tvOUOSnJO2JEzFUbkeSL5zgIQAsjlOsdTPlPW01X2Y0F
 SbEe1p6ScZjaI6BmvK7oVcR99MDreBr2jQnKb2z5AQ0EeuRaDfNVhPUauIwr3m7wVffq
 1LIWnX9NcMh71XQSgCerVYpiMDUz+mQ4Dack4B96PEcyZgfohIBXk2qkYuWVpQ5jv2Zk
 sxR8Wcn26YWIDTi6oGki9tqiZ4GItPEiIOGKtmveNeKTaqM5nlj6K57Llqd9+rg7b9eV
 vmb4wy6+511BZJMdgNXbLSdRUHe15paWMTMX2k0onQ3FlJc5qcrdTpLCA4FupuxKbHrT
 tqjg==
X-Gm-Message-State: AOAM533bHQH0cqtDGMf1b+i7XW2KF3b+dcixekLFTwAFqBC8vRNKJb6N
 Su2pat2agSYUoq468AEbNvmW5t1ISY2/8or250NRu5e40N1bvKjE6HWAGmxBtPr3frezqSuvbim
 MvWcJbnV00zClIsQ=
X-Received: by 2002:a17:906:5343:: with SMTP id
 j3mr146053ejo.538.1634740453300; 
 Wed, 20 Oct 2021 07:34:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/68z5GrYr3BstxGouMb3ZJvAnzr/UWxQ7OOY5d5QEdRoON1NPMihui6kByvIJL6tnJd6yGQ==
X-Received: by 2002:a17:906:5343:: with SMTP id
 j3mr146010ejo.538.1634740453042; 
 Wed, 20 Oct 2021 07:34:13 -0700 (PDT)
Received: from thuth.remote.csb (tmo-097-184.customers.d1-online.com.
 [80.187.97.184])
 by smtp.gmail.com with ESMTPSA id u23sm1310447edr.97.2021.10.20.07.34.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 07:34:12 -0700 (PDT)
Subject: Re: Deprecate the ppc405 boards in QEMU?
To: BALATON Zoltan <balaton@eik.bme.hu>,
 LEROY Christophe <christophe.leroy@csgroup.eu>
References: <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <ad151b9d-27a7-bb5d-2cad-1196ceecfdd6@redhat.com> <YWQB1FMhQfmqRYxN@yekko>
 <bcdf63a4-8d22-8b25-d980-7fc574f80e82@redhat.com>
 <be84c7bf-47d3-1ba8-20ca-084a487db29d@csgroup.eu>
 <8c382ce4-f706-376c-289a-b8c64393decb@redhat.com>
 <880f4bde-19fc-1267-3a04-3d9efd660897@csgroup.eu>
 <c09d92d9-a5a3-328f-824c-07653f8e649@eik.bme.hu>
 <be7a734a-b88b-3130-fee8-398387fb65b4@redhat.com>
 <262b6af0-b5c5-1d28-2f48-7a021c5cd0b9@csgroup.eu>
 <a3d28088-2012-9450-5491-1de77d962da7@eik.bme.hu>
 <d8c9661e-4439-b3f8-48d8-b6f659e862c8@csgroup.eu>
 <5491ed41-7328-3949-12ad-1a94f0f525d1@csgroup.eu>
 <6be2745-2eb7-7b85-31c3-def20eb21f@eik.bme.hu>
 <17b48b89-ef2a-f38d-b081-a3e2ffc1ca67@csgroup.eu>
 <51c1e658-a8ec-a41b-ef8f-a1677ea94f4a@kaod.org>
 <a9b483e2-9176-2349-2478-faa15592c28b@csgroup.eu>
 <38de2462-17ea-0264-5606-6e07b129920d@kaod.org>
 <e63df215-aacc-b57b-6ed2-d63927060eb7@csgroup.eu>
 <19612059-3e61-f920-339c-63162a94dd22@eik.bme.hu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a4d1571d-0419-054d-b127-8c0b57425f6b@redhat.com>
Date: Wed, 20 Oct 2021 16:34:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <19612059-3e61-f920-339c-63162a94dd22@eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "dbarboza@redhat.com" <dbarboza@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/10/2021 16.31, BALATON Zoltan wrote:
> On Wed, 20 Oct 2021, LEROY Christophe wrote:
>> Le 20/10/2021 à 12:10, Cédric Le Goater a écrit :
>>> I dont understand how
>>>
>>>    static bd_t bd;
>>>
>>> can be updated in the kernel.
>>>
>>
>> It's not updated in the kernel.
>>
>> It is supposed to be provided by UBoot to Linux Kernel. But modern
>> kernels don't take that anymore, they take a device tree. For this
>> reason cuboot takes the content of bd to build/update the device tree.
>>
>> Looks like QEMU also provides the bd, see ref405ep_init()
>>
>> I managed to get a kernel booting with the following change (and with
>> CONFIG_ETHERNET removed)
>>
>> diff --git a/arch/powerpc/boot/cuboot-hotfoot.c
>> b/arch/powerpc/boot/cuboot-hotfoot.c
>> index 888a6b9bfead..63a9545ff55d 100644
>> --- a/arch/powerpc/boot/cuboot-hotfoot.c
>> +++ b/arch/powerpc/boot/cuboot-hotfoot.c
>> @@ -132,6 +132,12 @@ void platform_init(unsigned long r3, unsigned long
>> r4, unsigned long r5,
>>                    unsigned long r6, unsigned long r7)
>>  {
>>         CUBOOT_INIT();
>> +        bd.bi_intfreq = 133333333;
>> +        bd.bi_busfreq = 33333333;
>> +        bd.bi_procfreq = 133333333;
>> +        bd.bi_plb_busfreq = 33333333;
>> +        bd.bi_pci_busfreq = 33333333;
>> +        bd.bi_opbfreq = 33333333;
>>         platform_ops.fixups = hotfoot_fixups;
>>          platform_ops.exit = ibm40x_dbcr_reset;
>>         fdt_init(_dtb_start);
> 
> So maybe taihu should also provide this boot info when linux_boot is true 
> (i.e. using -kernel) like the ref405ep does? Usually when using -kernel 
> without -bios then QEMU has to also emulate enough of what the firmware 
> would otherwise do like setting up devices and setting boot environment. Or 
> if we have both -bios and -kernel then maybe -kernel should tell the 
> firmware to boot a kernel but that may need a way to do that like setting 
> variables in nvram but we don't have models of that in taihu. This taihu 
> machine seems to be an early skeleton that wasn't finished, the ref405ep 
> seems to be more advanced.

I agree, looking code, the ref405ep board seems to be in a better shape than 
the taihu board. My u-boot image seems to run fine with both machines, so 
I'd suggest that we deprecate (and later remove) the taihu board, and keep 
the ref405ep board in QEMU if it is still helpful for Christophe (or anybody 
else).

  Thomas


