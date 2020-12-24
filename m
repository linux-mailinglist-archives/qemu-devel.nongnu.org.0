Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32982E25F5
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 11:36:16 +0100 (CET)
Received: from localhost ([::1]:56664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksNyi-0004W4-0j
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 05:36:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ksNws-0003bi-7S; Thu, 24 Dec 2020 05:34:22 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:53995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ksNwp-0002FK-1B; Thu, 24 Dec 2020 05:34:21 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.3])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B1120769ED50;
 Thu, 24 Dec 2020 11:34:15 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 24 Dec
 2020 11:34:14 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006da33c1e5-5133-42f8-a184-d86475672b79,
 1EADCDB2D537A6DD3E80F364D97246EF8095A17C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v2 1/2] ppc: Fix build with --without-default-devices
To: Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 <qemu-devel@nongnu.org>
References: <160875160729.98237.3219319022197329254.stgit@bahia.lan>
 <490464a3-d8a6-1814-2a5c-681eca3b96fa@kaod.org>
 <e84ce18f-5d8d-7ac5-3b3a-0dd9f0c939d1@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <8bd28b65-35d7-8913-9cd9-27798ab48605@kaod.org>
Date: Thu, 24 Dec 2020 11:34:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <e84ce18f-5d8d-7ac5-3b3a-0dd9f0c939d1@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a021be20-8d79-43ce-9cad-24b08620066f
X-Ovh-Tracer-Id: 7973341669018995619
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrvddtledgudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.521,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/24/20 11:29 AM, Paolo Bonzini wrote:
> On 24/12/20 09:26, Cédric Le Goater wrote:
>> In hw/ppc/Kconfig :
>>
>>    config POWERNV
>>        ...
>>        select XICS
>>        select XIVE
>>
>>    config PSERIES
>>        ...
>>        select XICS_SPAPR
>>        select XIVE_SPAPR
>>
>> and in hw/intc/meson.build :
>>
>>    specific_ss.add(when: 'CONFIG_POWERNV', if_true: files('xics_pnv.c', 'pnv_xive.c'))
>>    ...
>>    specific_ss.add(when: 'CONFIG_XICS_SPAPR', if_true: files('xics_spapr.c'))
>>    specific_ss.add(when: 'CONFIG_XIVE_SPAPR', if_true: files('spapr_xive.c'))
>>    ...
>>
>>
>> Couldn't we simply select XICS and XIVE in the PSERIES machine and
>> compile 'xics_spapr.c' and 'spapr_xive.c'  when CONFIG_PSERIES is
>> defined ? This to be in sync with the POWERNV machine.
>> or introduce 'CONFIG_XICS_PNV 'CONFIG_XIVE_PNV' ?
> 
> I think just using CONFIG_PSERIES is the simplest.  But it's just a cleanup, not a bugfix.


yes. No big deal and it can come later.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Cheers,

C. 


