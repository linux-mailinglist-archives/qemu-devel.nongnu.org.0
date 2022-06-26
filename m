Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59AD55B16A
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 13:16:55 +0200 (CEST)
Received: from localhost ([::1]:47180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5QG6-0005mH-02
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 07:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1o5QEx-00053h-6d
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 07:15:43 -0400
Received: from mout.gmx.net ([212.227.17.20]:46019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1o5QEv-0001Yq-4k
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 07:15:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656242136;
 bh=CAaTAT0TubzkBCdS9GrXElapKxcdx3fDdOu6C5xnPRY=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=GPoytT/dJe2sebWCzGNhD4OcalistPrVL/nJBMzRYoAywdTp0l7DohLHqiuXKy58H
 aKEZkUdeL0xfryxq+S+CAvMlf5yx5rpMrQgtt3uBgAQLmCnvovsBsIzRWFRsqC7sUt
 VbVpESmwYxnQ0ARfSMR/9rkfdBH9fdu7pheZ6Oso=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.135.166]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mz9Z5-1nkQwG3ZDv-00wDxq; Sun, 26
 Jun 2022 13:15:35 +0200
Message-ID: <62edb200-5989-3d8e-9570-e47ed7f1db69@gmx.de>
Date: Sun, 26 Jun 2022 13:15:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] artist: set memory region owners for buffers to the
 artist device
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, svens@stackframe.org,
 qemu-devel@nongnu.org
References: <20220624160839.886649-1-mark.cave-ayland@ilande.co.uk>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220624160839.886649-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+pqkbLSuN5M0f3zZ04dYQOuOz9c3VS5AiF6mJ02DHmbgQcFJ/DN
 l8n+WW5sxdngwkDiQEwddMpa0YVuEkV6MXRSLX0nimM+/P/h+mBjJarCigpnorZFKDWRCCd
 fDcE4FqTsYaFF2BCFwrg8YW90u9juDbCOjpqsJqSGOICRguTzVY8QxOHYJc8ElQk3ZC4+KP
 QRW3W3mBhywTevJYFl8cg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6DtcBaQYalQ=:UOq1FniCsE4C6GPa0wjviu
 BIOm5+qw5sVXq9gA6Tf5K7Cvr4j/TvYkUg0wDBvf4abxgxkCarwppFrlP0yvK1qDAbj0RQR8e
 ifjOELj93WGT1xSqRQG83DQGVqoXBxCFvLT2BLg5XRAurWSdMjzjhAWk7YJjPixllV9CzR0jG
 GrJ679glIrNqGJF15FvPi8M4vtA0gZh6H1AXjLVNwuK2b9P59hBFzZsyXskwAl/5I4/KSqxEm
 dVRVFDe3fqrtnMPO/KQjwatwUrasxGWIwwKKPtPhcc6HpD+SinMxRV0EDpGjbjtvpAmAotO/N
 j27Cair02lDXyzKKz+cCPwZRSa6GlHBX16gNHBQn7dp/wlYRNDUqCYKH1l24Xobtf93p4DCVU
 aI9VOqpJQiFBtywIf3L1WEu9+eDXgjCTA+Bw/RKiVAOhFjdKh5kVYmNPN1pq9HDhzBXb1pm2f
 tl/VGcHb4bd4176yoqQnl1+MzuJaW2NRrh+cXP4e6lIvZJux1I7X8XcFvRsw4OSUPoGnq0CGG
 cPT5YkTvNsiXn0PDUoKysDiqc9ddb9zxyV8QDGwHEt9YQsG9V1dmFXJU2RCjs9d32BskEHjU6
 WVYqaybXJqKdIFG+Tb0xfCNPyiBV6hrzhTiBi8hYmWPFAcoMSt9WzVzzSpReZg34LXl8GXpl5
 gVFUlXSfkPSuQs2Tc31CeGjDu55jLyL6UnHSvMS4GB2WHsggdJVxHZ6Mnbj49sRrfpNRs8aZd
 UNoW6PwOs61IO3GTcfcRJkOC/hrAOI4EEG003R5dKgaSsEnkxabFOZMJg/AaF/1rEGGG4Njoc
 Jr7Xoeb9eeVgOOZoRPg6oVeWpgALEAElHVbfdLS97nCE30E9hNVVJnhVMTqSgkbbNyGKB6Dpp
 oHASoxKmWAsbqXFwxNESRcne708Zvy+wi1aYUWGQdRDaS/mjHUnvb4+p1hKt/U3dXfWtw8tmb
 A7oVGvpTcjD5ZTmm2Tg0qHOfSe+akOAcFmSzuU8cz4KsMoP0A3I7p+4yDjd9/mPFQhtftiEmy
 drgJ/rcRsqXaQtXMcjGaYe62847kl+ShIkLMYklPhPSk4zxEkXNzjyrCUDLtSYqVfLlL/MIBo
 EKAOgwCB2QpcM1N7k1bf/MLGTXwvIcIcObtu6DETCPotLykMJyIYmAYuA==
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/24/22 18:08, Mark Cave-Ayland wrote:
> This fixes the output of "info qom-tree" so that the buffers appear as c=
hildren
> of the artist device, rather than underneath the "unattached" container.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Helge Deller <deller@gmx.de>

Thanks!

Helge

> ---
>  hw/display/artist.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/display/artist.c b/hw/display/artist.c
> index eadaef0d46..fde050c882 100644
> --- a/hw/display/artist.c
> +++ b/hw/display/artist.c
> @@ -1358,7 +1358,7 @@ static void artist_create_buffer(ARTISTState *s, c=
onst char *name,
>  {
>      struct vram_buffer *buf =3D s->vram_buffer + idx;
>
> -    memory_region_init_ram(&buf->mr, NULL, name, width * height,
> +    memory_region_init_ram(&buf->mr, OBJECT(s), name, width * height,
>                             &error_fatal);
>      memory_region_add_subregion_overlap(&s->mem_as_root, *offset, &buf-=
>mr, 0);
>


