Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B675B64EE4B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 16:55:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6D2V-0001bW-Ml; Fri, 16 Dec 2022 10:54:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1p6D2K-0001aD-Gt; Fri, 16 Dec 2022 10:54:12 -0500
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1p6D2G-0008Pl-EJ; Fri, 16 Dec 2022 10:54:11 -0500
Received: by mail-lj1-x22d.google.com with SMTP id g14so2557066ljh.10;
 Fri, 16 Dec 2022 07:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vApu+GYCXSbLDDidMzR4XeX+hdUDS9FFXN7m1mFyaWY=;
 b=pejz2Z42LfQIMmxrPzN8pH9ilLu7T+LAByN7EYRxD70LoOU4UbG99S3mvj9UDxAzIC
 C+kQNBmukFi9hWSkSm5qPhUrCD95zpo1Cz+6AyPpusae66cfNXE9m0xhvoDu2Gmr92bK
 OsEGnTr8vwu0ZDRt321O4pMW+rNfDENgVwySfQi/SaWk7bwbLSuiQH7ivK9Yb2HHknuG
 0KoJstbHg+wB/aWibv7zf5l6Ktq5Vw7buVM+8k9nGUT+27+Wt5eO3+m6wbdmBsEiQb0J
 YzGTyciyCnNBuLQP1ToWC8ICaornFNEVfHK3/Z1MWwMPnL7dzbvRIr50l1lPiDQqMsD3
 yBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vApu+GYCXSbLDDidMzR4XeX+hdUDS9FFXN7m1mFyaWY=;
 b=o2pFYTJUr0dWmSnVrd0ADx7K/rEd2lwPPY14XyUNCbgHWE87ftEFCpQzq18lhpArRW
 MH+WWOBiekNfRTfTFE1L1EfAQc59M3l/MMQ7G25UM5lpO7oeIbsTwZu6f/pgTmyT0aSo
 wAitckL/6yFz9Y/4hI0avDlZhsc5/Lqqu+/rCDfY4QJsx8cl3eX0ai5NpGlNVxgdgznB
 49nvps0MNKj9i2xbgSMOdBdjN3GOa9NGAJ9c6KTa0f/xfS4+LI2B/sJ+m5CveDHgKUs5
 fy+FKEkHlu4xi7gS4C5B2etgGImkpIYsJwZhajg7eVZKLn+7qz9HSivnXoh8EsWTy1xb
 gdPg==
X-Gm-Message-State: ANoB5pn5Qpc7C8uhEMN2UaWBRGgg5odL3RHr05QdCzkBT9+1QYrUzYeO
 ln2txhxEszg98OIDiXy+/g4=
X-Google-Smtp-Source: AA0mqf5bIoPgEzj1P1l9vahfl7u3HflDcKXrggMPBm1LJBr9djM1ZCg6340UwyyFf+r9sqbBG822dw==
X-Received: by 2002:a05:651c:2110:b0:27c:552a:f968 with SMTP id
 a16-20020a05651c211000b0027c552af968mr4709877ljq.17.1671206044808; 
 Fri, 16 Dec 2022 07:54:04 -0800 (PST)
Received: from gmail.com (81-232-4-135-no39.tbcn.telia.com. [81.232.4.135])
 by smtp.gmail.com with ESMTPSA id
 h10-20020ac2596a000000b004b4b69af17dsm246106lfp.214.2022.12.16.07.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 07:54:04 -0800 (PST)
Date: Fri, 16 Dec 2022 16:54:03 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Greg Kurz <groug@kaod.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 3/6] hw/ppc/virtex_ml507: Prefer local over global variable
Message-ID: <Y5yUm8dndqzGJbCC@toto>
References: <20221216145709.271940-1-shentey@gmail.com>
 <20221216145709.271940-4-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221216145709.271940-4-shentey@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Dec 16, 2022 at 03:57:06PM +0100, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>


> ---
>  hw/ppc/virtex_ml507.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
> index 13cace229b..f2f81bd425 100644
> --- a/hw/ppc/virtex_ml507.c
> +++ b/hw/ppc/virtex_ml507.c
> @@ -157,7 +157,7 @@ static int xilinx_load_device_tree(MachineState *machine,
>      int r;
>      const char *dtb_filename;
>  
> -    dtb_filename = current_machine->dtb;
> +    dtb_filename = machine->dtb;
>      if (dtb_filename) {
>          fdt = load_device_tree(dtb_filename, &fdt_size);
>          if (!fdt) {
> -- 
> 2.39.0
> 

