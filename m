Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC95553E4A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 00:06:14 +0200 (CEST)
Received: from localhost ([::1]:58104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3m0i-0004UH-EB
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 18:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3lzN-0003Al-1e; Tue, 21 Jun 2022 18:04:49 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:34513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3lzL-0003lK-Bl; Tue, 21 Jun 2022 18:04:48 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-101ab23ff3fso16406934fac.1; 
 Tue, 21 Jun 2022 15:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=MqkNTP9wQ1g00uHPuwj4paBsaeuIscZchKlVeR30qjQ=;
 b=TQ2mquHdQZVVzvFR0WALORXBHkRVn9CjkBr9L/G5wqX2phfj0c2JxNr8zw4Qh9NMfR
 oL8d79fkFNDWKACJVi5icA/2fARb1WSFzgMbmpYjXeZmvROiwEflhjaoVOqh47cJGyjj
 KVdLcUfmoeKgTZXIqu9f1ApiXTaHE8lpOOazatuYsCNLaDs+KgJJpXMJJ+p4j5h6t7ZV
 EqUD2dTANZWv7xicYzCho272Y8ZdPCPVp+NeabbE4jxTXDo5LVantgrz5/KSI1/7SxHF
 2TKfNnbL5zoKjJMu4XhCFTBR5XagsosRxFp1v8LFGhi50iUkDAOiZ+JyxdxoueNsBrY9
 dGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MqkNTP9wQ1g00uHPuwj4paBsaeuIscZchKlVeR30qjQ=;
 b=WF3OmpWrwWJPmDOJ+etwD5y3GgSNzsAFNZ8DeEt5+CgbPUiu3EVS1/VcD9sRMy3ose
 CPAbyHGNGAmVgUxXBTzNw8q0ZN1VflKaOVyYf2pRFGe4unh53IIOZsKWIkfXgUJ+hJ/r
 wW2jt4Fq3uRKEZ/YmhEY8zIhIQpUK4t2vLOkUKuvvtEW0As9q3ZWCZeQAnFeL7l9WHrs
 i5gDsACBQ2XblKDsGAWFMTd1JBYzGIr44+w68irlh85JutH7RCQVjUqKw1FMRrt2s5aZ
 rBfovZ+iCeD7a8eXBeHuLflKAeCShSrPAFGpJpW1tvRy8YE1Vx058dhiC0P43mgtttZf
 TF2w==
X-Gm-Message-State: AJIora8VbWhWWctOF5wh4sGNUCnvnnKGb/ISjD5epup6IjRZjhfy1wY8
 8mMbYvv9Zr+RtTha1WOmxf4hvSp2Dbf4Vg==
X-Google-Smtp-Source: AGRyM1syk/r8BNIlBnbkf75np98VRS088A2LPg+/L4si5ZJlBx290THV4NW6F/niF5yiscLYWL97LA==
X-Received: by 2002:a05:6870:51cb:b0:fb:5c97:bd1b with SMTP id
 b11-20020a05687051cb00b000fb5c97bd1bmr170353oaj.104.1655849085265; 
 Tue, 21 Jun 2022 15:04:45 -0700 (PDT)
Received: from [192.168.10.102] ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a056870540100b000f342119f41sm9782273oan.42.2022.06.21.15.04.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 15:04:45 -0700 (PDT)
Message-ID: <b2f5539f-2504-3c20-1f2b-5b7f03f2ea52@gmail.com>
Date: Tue, 21 Jun 2022 19:04:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: AIX 7.2 guest, Windows 10 host, networking, qemu 6.0.50.
Content-Language: en-US
To: pade@trifox.com, qemu-ppc@nongnu.org,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <00d101d88588$173538c0$459faa40$@trifox.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <00d101d88588$173538c0$459faa40$@trifox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Paul,

I'm CC'ing the overall QEMU mailing list as well to increase the chance
of finding someone that runs QEMU on Windows.

On 6/21/22 13:00, Paul Dembry wrote:
> I have AIX 7.2 installed and running fine however I cannot get any access to it via my LAN. I have tried multiple variations of -netdev and -device, the AIX system “sees” en0, but nothing more.


This is a working example of an AIX guest with network using the spapr-vlan
net device:

-M pseries,ic-mode=xics -cpu POWER9 -smp 2 \
-device spapr-vlan,netdev=net0,mac=52:54:00:49:53:14 \
-netdev tap,id=net0,helper=/usr/libexec/qemu-bridge-helper,br=virbr0 \
-device virtio-scsi,id=scsi0 \
-drive file=./disk.qcow2,if=none,id=drive-scsi0-0-0-0,format=qcow2,cache=none \
-device scsi-hd,bus=scsi0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0-0-0-0,id=scsi0-0-0-0,bootindex=1



> The examples I have found all use a linux host which I can use however when I set up the bridge device, I lost LAN connectivity to my linux machine (ESXi guest). What I want to accomplish is the AIX system appearing like any other machine on my LAN with bi-directional connectivity. Failing that, it would be ok if it spoke only to the Windows host because I could move files to/from the Windows host and AIX guest. Has anyone been successful at this at doing this or have any ideas of how I can accomplish this feat? This would be very handy because my “real” AIX box does not have an HMC and so I cannot remote boot it.

I've never tried to run QEMU using Windows. I'll give a try when I have the
chance. I guess that one core difference is how you'll create the network
bridge for the guest.


Which command line did you use to create the AIX guest?


> 
> That fact that AIX 7.2 even comes up on qemu ppc64 is a tremendous achievement 😊!!

An even greater achievement would be to make it work under a Windows 10 host :D


Take care,


Daniel

> 
> Paul
> 

