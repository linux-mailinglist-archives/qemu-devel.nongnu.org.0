Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 318592F9F12
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 13:06:58 +0100 (CET)
Received: from localhost ([::1]:45288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1TJB-0001p5-93
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 07:06:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l1TH4-0000kS-OK; Mon, 18 Jan 2021 07:04:46 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:44413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l1TGz-0006UD-Qb; Mon, 18 Jan 2021 07:04:46 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N5W4y-1m8EBn2EWI-016vNa; Mon, 18 Jan 2021 13:04:25 +0100
Subject: Re: [RFC PATCH v2 15/20] hw/nubus/mac-nubus-bridge: Mark the device
 with no migratable fields
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
References: <20210117192446.23753-1-f4bug@amsat.org>
 <20210117192446.23753-16-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <641232f7-5e65-f066-b1a3-24a89e074eab@vivier.eu>
Date: Mon, 18 Jan 2021 13:04:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210117192446.23753-16-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uhQ20pO53uAaHGI95lgej+N+JCXx1J/pYMIgsjU6VGFH0+kSx4k
 1V63uBA45aafqYAWORdipxcR/yWWxhqHFI01AmpeOxdKKs98STtG2dW3DtLaDHE/K++Mjdc
 ggoWO0xNDuo3RR45Zd0gqB8dSmQalxcxCcd1jQtc7W4WlwsvK33o0hqRWUSUXbhuZcVWPBW
 OOb0A4g9Xp50L6cuUgcpQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oTBFu+24Gd8=:nnASlFm8m4tUi5ehpptpS9
 L8bIe4mhb61Y8+LdlUwxk4AbbWvo9pDpfW7EUhXKp5XGZC84W+qCaAAVTJcWADRINcMIo4txb
 Mths7T9M7o4yl4+VUia9VNdZ99mEBp8JDrwXSrqob8ICJ8wERfZsSFnmm/uyTYsGlTXEzS5Md
 Kh3jfeiRj/IC+R2xySuftnN+FoMgTdkBdZPufIWZKsb322F+znMcOuW4ptiZabr8BJcLtLC5I
 GI4yTCn3g7NbsUDFegEun1Qk6bUlNz7faNq2C3nM0iJuvvzjAVJKJWpRzXTdTSq3zXtRmo0TK
 IPQYBGczR99Xx2PZMWZpmm2KTB0D2EwdeauURx4JHsiou8r5hjhIbY53SqLVxH9rbwUDfHGk+
 oGkvxDQDPVCl/3LEIleQC4FoEu+Yql1LyuJdRQXJkYQVUibuBu2LxlEyUtLAC
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.194,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 17/01/2021 à 20:24, Philippe Mathieu-Daudé a écrit :
> This device doesn't have fields to migrate. Be explicit
> by using vmstate_qdev_no_state_to_migrate.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/nubus/mac-nubus-bridge.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
> index 7c329300b82..ede36ccc5dd 100644
> --- a/hw/nubus/mac-nubus-bridge.c
> +++ b/hw/nubus/mac-nubus-bridge.c
> @@ -27,6 +27,7 @@ static void mac_nubus_bridge_class_init(ObjectClass *klass, void *data)
>      DeviceClass *dc = DEVICE_CLASS(klass);
>  
>      dc->desc = "Nubus bridge";
> +    dc->vmsd = vmstate_qdev_no_state_to_migrate;
>  }
>  
>  static const TypeInfo mac_nubus_bridge_info = {
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

