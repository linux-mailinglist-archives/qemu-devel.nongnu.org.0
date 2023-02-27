Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE9C6A48B9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 18:57:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWhkW-0008QL-W7; Mon, 27 Feb 2023 12:57:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pWhkU-0008Ox-I1; Mon, 27 Feb 2023 12:57:18 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pWhkS-0004nQ-Uu; Mon, 27 Feb 2023 12:57:18 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C13965C0152;
 Mon, 27 Feb 2023 12:57:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 27 Feb 2023 12:57:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1677520635; x=1677607035; bh=Kacer/IYEC
 DKjenIoT6+Pppv/goPRDlTSOqSgovUufc=; b=YMYDRK0476KQeiCVVDiWb1P5YL
 hxp+d8yKuhGIArgFcgTkJh7T0DMmIU9R9cDXF8PavjUMA5jFad+cwe3RQIGLTu00
 kWLbPd5oExKs9ZZP20etDR5+qtWTopXFAe9a1lXpYTxR+3QVwk3HgYqyvIaYS6kJ
 /l36o6N/LxeYnHt8QR5Sy7ql3//OIC8WSJRqY/e0By156yveebl6+PCj874C3sPU
 r1PJRd8hEVjsadQ9qYAagc9c41p20pnCW5QqUXwP8NOpgnAC+qjxxUcBbg4v9On7
 Cik2/E5W/wiqYSxvZ8JL4AeRci/YocGWOal0BM4j6gzr3bJjfJqCBOkwuiyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1677520635; x=1677607035; bh=Kacer/IYECDKjenIoT6+Pppv/goP
 RDlTSOqSgovUufc=; b=MowPilXwWmIRorTNeFnROj6YZzAakFCQtfw61x2b5ta2
 rWoUI2K20y1/BfEhIFOlvQYmfwjR64qZYMHYrAQ8Y/brgrbN1HNW9ofGUP5rxwGv
 I+Aeu9UBPXHMGV1gXTT+NZ8KDNltE7xaMiXGTf2/iro9nLIRPUWNMrrxn8v8FhXu
 EjpxwSBgxU60AC3vOnMuOUM5odAH+kUP31iRMjZfSqF40UR2ZD3s7klIC4Inx6tM
 dAdp7LNUciS3nrtFM6q6a9xx8boMQ5pVo9XZhswmkqnJB9PJ4uA/TRp6Nx2q4hWC
 VxBnAXma4i0Zo5UMFycmxPexLmL80RrhqhQgIENV+w==
X-ME-Sender: <xms:--78Yxp4Qnx2YOcIq246h-e1AAOsGpb16mEH6uBsNdeHA8XyXfhteg>
 <xme:--78YzqbIiyCZAvJcOeJxR1KnlYDXt8krCFH5yQogMVh8qE8zcoRmmvEtvBpBkmII
 1dzo9rkpH2vUcPJCyc>
X-ME-Received: <xmr:--78Y-OLCj9Chks4u8CHjXWFu1A9k0AVOf1zGEX7wY7MwMdzY_oEcUyka8MwK0IIOxXdq17_jYm9XsAaZIWxkRGd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeltddguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesth
 dtredttddtvdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgv
 rhesphhjugdruggvvheqnecuggftrfgrthhtvghrnhepudetiefhffelueevkeegudfgfe
 efhedtgeeuffffhfelhefgudeujeejkeefueeknecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:--78Y87tUmWL59YKgQvSL-lR-LQf0IV8aDoItsdYbigTv-mVyuvaRA>
 <xmx:--78Yw4ZIsCBRztXgZjFrZ1Aj74Cwj6yV0ye_HrwrCTKJCJlNFNsvg>
 <xmx:--78Y0jb1S7AtfdPGwFs1qy4sCl7Ess8V4CnBG7gktSN_f4Hr2PyeQ>
 <xmx:--78YxEeV34Awh2S-qB8AJETmGHHWCAIirCjMqUyABdTEKsWyOQNLA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Feb 2023 12:57:14 -0500 (EST)
Date: Mon, 27 Feb 2023 09:57:12 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: ~ssinprem <ssinprem@celestica.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org,
 ssumet@celestica.com, srikanth@celestica.com, kgengan@celestica.com,
 clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au
Subject: Re: [PATCH qemu v3 2/2] aspeed/fuji : correct the eeprom size
Message-ID: <Y/zu+GgrdPbT8BzB@pdel-mbp.dhcp.thefacebook.com>
References: <167660539263.10409.9736070122710923479-0@git.sr.ht>
 <167660539263.10409.9736070122710923479-2@git.sr.ht>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <167660539263.10409.9736070122710923479-2@git.sr.ht>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=peter@pjd.dev;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Feb 17, 2023 at 09:59:53AM +0700, ~ssinprem wrote:
> From: Sittisak Sinprem <ssinprem@celestica.com>
> 
> Device 24C64 the size is 64 kilobits = 8kilobyte
> Device 24C02 the size is 2 kilobits = 256byte
> 
> Signed-off-by: Sittisak Sinprem <ssinprem@celestica.com>
> ---
>  hw/arm/aspeed.c | 36 ++++++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 27dda58338..40f6076b44 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -840,42 +840,46 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
>      i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
>      i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4d);
>  
> -    at24c_eeprom_init(i2c[19], 0x52, 64 * KiB);
> -    at24c_eeprom_init(i2c[20], 0x50, 2 * KiB);
> -    at24c_eeprom_init(i2c[22], 0x52, 2 * KiB);
> +    /*
> +    * EEPROM 24c64 size is 64Kbits or 8 Kbytes
> +    *        24c02 size is 2Kbits or 256 bytes
> +    */
> +    at24c_eeprom_init(i2c[19], 0x52, 8 * KiB);
> +    at24c_eeprom_init(i2c[20], 0x50, 256);
> +    at24c_eeprom_init(i2c[22], 0x52, 256);

Perfect! Looks good.

Reviewed-by: Peter Delevoryas <peter@pjd.dev>

>  
>      i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x48);
>      i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x49);
>      i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x4a);
>      i2c_slave_create_simple(i2c[3], TYPE_TMP422, 0x4c);
>  
> -    at24c_eeprom_init(i2c[8], 0x51, 64 * KiB);
> +    at24c_eeprom_init(i2c[8], 0x51, 8 * KiB);
>      i2c_slave_create_simple(i2c[8], TYPE_LM75, 0x4a);
>  
>      i2c_slave_create_simple(i2c[50], TYPE_LM75, 0x4c);
> -    at24c_eeprom_init(i2c[50], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[50], 0x52, 8 * KiB);
>      i2c_slave_create_simple(i2c[51], TYPE_TMP75, 0x48);
>      i2c_slave_create_simple(i2c[52], TYPE_TMP75, 0x49);
>  
>      i2c_slave_create_simple(i2c[59], TYPE_TMP75, 0x48);
>      i2c_slave_create_simple(i2c[60], TYPE_TMP75, 0x49);
>  
> -    at24c_eeprom_init(i2c[65], 0x53, 64 * KiB);
> +    at24c_eeprom_init(i2c[65], 0x53, 8 * KiB);
>      i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x49);
>      i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x48);
> -    at24c_eeprom_init(i2c[68], 0x52, 64 * KiB);
> -    at24c_eeprom_init(i2c[69], 0x52, 64 * KiB);
> -    at24c_eeprom_init(i2c[70], 0x52, 64 * KiB);
> -    at24c_eeprom_init(i2c[71], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[68], 0x52, 8 * KiB);
> +    at24c_eeprom_init(i2c[69], 0x52, 8 * KiB);
> +    at24c_eeprom_init(i2c[70], 0x52, 8 * KiB);
> +    at24c_eeprom_init(i2c[71], 0x52, 8 * KiB);
>  
> -    at24c_eeprom_init(i2c[73], 0x53, 64 * KiB);
> +    at24c_eeprom_init(i2c[73], 0x53, 8 * KiB);
>      i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x49);
>      i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x48);
> -    at24c_eeprom_init(i2c[76], 0x52, 64 * KiB);
> -    at24c_eeprom_init(i2c[77], 0x52, 64 * KiB);
> -    at24c_eeprom_init(i2c[78], 0x52, 64 * KiB);
> -    at24c_eeprom_init(i2c[79], 0x52, 64 * KiB);
> -    at24c_eeprom_init(i2c[28], 0x50, 2 * KiB);
> +    at24c_eeprom_init(i2c[76], 0x52, 8 * KiB);
> +    at24c_eeprom_init(i2c[77], 0x52, 8 * KiB);
> +    at24c_eeprom_init(i2c[78], 0x52, 8 * KiB);
> +    at24c_eeprom_init(i2c[79], 0x52, 8 * KiB);
> +    at24c_eeprom_init(i2c[28], 0x50, 256);
>  
>      for (int i = 0; i < 8; i++) {
>          at24c_eeprom_init(i2c[81 + i * 8], 0x56, 64 * KiB);
> -- 
> 2.34.6
> 

