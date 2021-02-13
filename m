Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806F331AE4B
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 23:38:46 +0100 (CET)
Received: from localhost ([::1]:37358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB3Yr-0000nv-2u
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 17:38:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB3Y7-0000EN-HW; Sat, 13 Feb 2021 17:37:59 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:60813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB3Y5-0006a9-TB; Sat, 13 Feb 2021 17:37:59 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N7iOw-1ly5gQ30T4-014nob; Sat, 13 Feb 2021 23:37:44 +0100
Subject: Re: [PATCH] hw/i386/xen: Remove dead code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210202155644.998812-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <d8c7c2c9-031c-3534-d828-c3b232edc674@vivier.eu>
Date: Sat, 13 Feb 2021 23:37:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210202155644.998812-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fg0slwWmDeG5W6CXwD+LFOmr7nTkZRJYbYVrZF2KgwJh4tqjenM
 /hoyI99CpsCV3jiaMWNDOkcczLbBun/CfFUn76o4NhdEcPcjBcQLizPk/jxuAmjF9DPXyzV
 6G+ldbCmL3v7cvczTf6OCu7yC/BYDtFsk4yAJ3rMRTESsBqOdvV/houE9RMe95Ll73EzaSh
 p04cUr9ZL3aCPiOAf69JQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oBoG6KzYfQA=:I1QJIt5t3ob4iCy8v8Avoz
 pN1hkJnA/17x4K02MXs94pUg5fkJWO2R1rJk4b0qHhUcLy+QSTkYegggX06uj4vaSOOyyKHd/
 ohf5fakZi3ZurGMJqqcmv+NT2IxP8eftr77lSqM9bFkfvgRFaCOc5E303yzg5kSGhAaaYbMLw
 kDZL2wGKFRczeCJQaRnAqTP5FeOK5+BmQZ5F5HfmH7o65gicGik2qpiUoV/WROV9pIcIWsaey
 XjIn0ounM2CztblyWF/Qa27qFP23hoFcVe7tuKaCQXUMfHBOMBNC9n1V6EJjptO0d6Iq2T2O4
 8nUVxIzyY66I+0iwRCnBk9TOe0F78rVcx+CpxTqq1lDrUXkHSnq4SkGRNICzdPgWycnsaGYlN
 iuLDhH3DguoBQD9OuhM5rMDD+JIwgJbQYkvw77bPuYF9lGKd/j6W7cYZq4BTuvVB9gP80wILa
 E9sYo8oLNw==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 02/02/2021 à 16:56, Philippe Mathieu-Daudé a écrit :
> 'drivers_blacklisted' is never accessed, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/i386/xen/xen_platform.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
> index 7c4db35debb..01ae1fb1618 100644
> --- a/hw/i386/xen/xen_platform.c
> +++ b/hw/i386/xen/xen_platform.c
> @@ -60,7 +60,6 @@ struct PCIXenPlatformState {
>      MemoryRegion bar;
>      MemoryRegion mmio_bar;
>      uint8_t flags; /* used only for version_id == 2 */
> -    int drivers_blacklisted;
>      uint16_t driver_product_version;
>  
>      /* Log from guest drivers */
> @@ -245,18 +244,10 @@ static void platform_fixed_ioport_writeb(void *opaque, uint32_t addr, uint32_t v
>  
>  static uint32_t platform_fixed_ioport_readw(void *opaque, uint32_t addr)
>  {
> -    PCIXenPlatformState *s = opaque;
> -
>      switch (addr) {
>      case 0:
> -        if (s->drivers_blacklisted) {
> -            /* The drivers will recognise this magic number and refuse
> -             * to do anything. */
> -            return 0xd249;
> -        } else {
> -            /* Magic value so that you can identify the interface. */
> -            return 0x49d2;
> -        }
> +        /* Magic value so that you can identify the interface. */
> +        return 0x49d2;
>      default:
>          return 0xffff;
>      }
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

