Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76D83A6C78
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 18:53:38 +0200 (CEST)
Received: from localhost ([::1]:43978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lspqD-0005A1-Nl
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 12:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lspoZ-0003yx-PV; Mon, 14 Jun 2021 12:51:55 -0400
Received: from mout.gmx.net ([212.227.17.22]:41325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lspoX-0003Vr-Oc; Mon, 14 Jun 2021 12:51:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623689505;
 bh=Lt3NV0JNoVrxXU8gJvlc5oxu5N9ffTgCzfIClsIW2JM=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=T+xMzO7+Lw6LXXDSAsDUHvQa6DFEGIDiyz786zDg+8UhldCYfZfqTvP5nQfesSxUA
 cK5xdzH69Er9227/NgSdKnf8wM5NZk1DcNFa3yLXXY3QvewvFrQj8E3g4mjgXQFW9y
 t9fbXEpDUfkvJLJq1O2OKyN9EG+PeDlOv9n5Q59Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.35] ([62.143.247.63]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9Mtg-1lE7oz24Si-015LLE; Mon, 14
 Jun 2021 18:51:45 +0200
Subject: Re: [PATCH v2 1/3] hw: virt: consider hw_compat_6_0
To: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210611234631.81314-1-xypron.glpk@gmx.de>
 <20210611234631.81314-2-xypron.glpk@gmx.de>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <6eba1d8b-ec27-bfb6-beff-b7b1d8abd271@gmx.de>
Date: Mon, 14 Jun 2021 18:51:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210611234631.81314-2-xypron.glpk@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0e7nMSuSffPtff1xaa6x6etPJ/rjryHdvWS6NvYymovJBQ3IKDY
 SVx9af/Ua0so6tn+/m1ldSHs9WRQbJPPPSRvaSgmajFPA5Hnqjdgn+OB8fPeytU0TEfNYYM
 wEIsPL0fI9+bBRVY1e9MuqYecY+2j4NdVC4BBUlTc7HJbuVZffZKJ/NFaeLfsyoKRWvv6Ix
 I1hrNtDSoGETPlPRuB1Gg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xta0+34bc+Y=:Se1eSHQZgbLyFbIcAyqFOt
 axweqqWgYwrQ0SJ0qTxZs/o/m1N6VH29r5imZBw8AM62R6M+FHTE/DrCLnJ2q9mL0fBvNpp8x
 Opx1BDkJ1D2BM1kZfqk+QEohQfDGNyxGF9Ne14q2zqVu1XgJAjfNYAHdXAv2Go4LPFnlS4D0F
 ON4Thfhn3wEew7WwgI7Qc2ETj2uFQsJPB67m/3sEA5JValV5E29O7Zg+Zx7TYPKG3s7DTvrPN
 M8nZqertLnRlodE1lR+aGTvu2f5lYDCRqXRbSyQ2L0sM8UUkA+iLWmFHlDC81gxCSmPuK7r8v
 ExiVSGUUyo3GNjT+cufbG7ZinH46b9xV7T6eaHPLfMc9QHya4WSbymrikYLsW96MnsTVxsM02
 iI8fY5k9oCh/mQ+WfaYK7JLcmb3w8vjNhNH9JF0SLTPMXF/43sfL/ZOk3ZMA/ciZ6K4jkFo4r
 7tnhZRgs8mLimrSpF8iSG2QoIuGRpXFW3MVbZUlavnzGfTMOXGxBa9PTvtgOxXWcOJtEKeVBe
 nz10uZyegaVqBrGUwase5U4CIibtghOyoZS+iuctmIzAdq3GTnIqBuAuxjKfLlJiTi/5bXm0I
 j9OP3gnA1+zlNjVIrppibeOGOQXPOQR1SFhr0bfSI2DvOWWDegoJ9selqm/blKR5Fv01mHPA2
 ZhZbd/AJiVZ2d0YkqlOxi6k/eK7EfGKN5WHQABybFbO7781xOPg1RxrQW1N0NJZ3xwqGlOlPJ
 sfIG9ns+vwxoYyoPEaQvQsIpHS75H3cCaYdZn4aMYRUzQ2UKYUW8V1ZqQB2sGmV0OTBsgNVmn
 oJMpDJ8mrbdJjAS+552NTU+1P1whxEwQsygxiMwJ94XzgGZX5V5vJVcogz2K/E+NUX5svSfZ/
 zPRaUuLYoXami1ef5ht3rZLmbMsFVZ9cY0Hs+IfRMK+wlepgEQtN0UWyAgdYtEE19tNWPmB8R
 3mhoJtRPCjIX9zo/yyr625Fak4j9HUWFSgSwlBrZWqzV2v5tPpBR9TRPxSZAhPjUxyAvhgmYa
 m8RsVa4CpUo0Ot4cUF7m+WrfrY4YXTmZFtPq/QbyF30rjufW9RSaKgToVpIq6O8nf+f+yPYHn
 wLFBnXmQ9LFyB48fD1P+lfiRlw5lZ8Lz8EQ
Received-SPF: pass client-ip=212.227.17.22; envelope-from=xypron.glpk@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.489,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/12/21 1:46 AM, Heinrich Schuchardt wrote:
> virt-6.0 must consider hw_compat_6_0.
>
> Fixes: da7e13c00b59 ("hw: add compat machines for 6.1")
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>

This patch was applied to target-arm.next by Peter.

> ---
> v2:
> 	add missing Fixes: tag
> ---
>   hw/arm/virt.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 840758666d..8bc3b408fe 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2764,6 +2764,8 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 1)
>
>   static void virt_machine_6_0_options(MachineClass *mc)
>   {
> +    virt_machine_6_1_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_6_0, hw_compat_6_0_len=
);
>   }
>   DEFINE_VIRT_MACHINE(6, 0)
>
> --
> 2.30.2
>


