Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6F13E2DC5
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 17:29:24 +0200 (CEST)
Received: from localhost ([::1]:56632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC1ml-0000R9-7M
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 11:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mC1lm-0007y6-5b; Fri, 06 Aug 2021 11:28:22 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:40345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mC1lk-0004Dr-Jb; Fri, 06 Aug 2021 11:28:21 -0400
Received: from [192.168.100.1] ([82.142.6.46]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M8C8J-1mGgbX2bdT-005Li2; Fri, 06 Aug 2021 17:28:12 +0200
Subject: Re: [PATCH] vhost-user: add missing space in error message
To: Alyssa Ross <hi@alyssa.is>, qemu-devel@nongnu.org
References: <20210806143926.315725-1-hi@alyssa.is>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <49768442-1683-8268-4174-9be59d3577cd@vivier.eu>
Date: Fri, 6 Aug 2021 17:28:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806143926.315725-1-hi@alyssa.is>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JN+9brpZOFZspzlazEdpZu4uSt4jE+WB/TyP7DLo7nk6OkhFu1Q
 Hwxy680qa6SR9aa4OfMXvBSTd3UsC5zSLlHA1bFyFrbvNOuByqAsthcO61jmsmLBDhiDWil
 YimIcdco5Uv4SZ5egfh3z1ZJS84vx1MEMSj2Ovl/4NSPagKKNf6aJOME7fJK+/ewnPpH9YU
 lsTz8g3gY1a3SFLswNwMQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mv8yMHvOtTg=:IiNqDvNzrlJ23N3xIoZn5K
 sZlqinA6/RZ6rGEBl71TJCU4MhJmzbGkXbk3gCBirJxyy8DzysD0NurfRqHTSb1dRLRnI3IHq
 i4R0zvzFM6Ey8hQKYf5wcBRdUBjLaxOVhX3XUGE1RcOCTjzXvnR7ArN6ZLZmPZCTpOphwIX61
 focbFshahhYECVLjpxpfvRc6EtekpERSjU1zakZ++h8yuWZQAIbcs2svgASpNzx16d+b97rFV
 lirgU4h+7RXN79sVikqL2TP2+4Uk3yYkUx6lpXDokk0uzKxHWVFNcVi16CcGvGYJB4AQOZu0X
 LFPdwO2XpayvGjRba3NTrhsB//nxHCKpKHCSjhJmwi0MNukqvaZtdmXGAtBQ0jHEOYbW63syW
 dx2pzIjVcz+MemcJEbfFIehaCBymrDNLZq4wFciLRa0qq3Rq4A7KdsvDT+BM/Qv3f+jTEnuqS
 7LT0dedc7q6wC+0cQ8ANxz5NrSu0fi/le1aDDzJcB4xwuiSELYgKeVAUoKAWgICHqUWbJPP/Q
 Otfp5B5p+cjxLzO+VcbZlNNEm1UDJcpNsugYIzyIExZJ37a5qLhoGR6a2AG6BDX2YsYrjI1GK
 O+b41deurc3qo/YjnRjUEJ2i3T3I3udQEPDlXeS/Ztm4FGjgjbMaz3w9HeRXozbjrhOF6c8y4
 g7KkU+zSCwLLSFvt1cgdLMpDp+LjrSySur9ml2v6jZfcbcfJwnePFazVO7NowLuyeVmrWRL2v
 CbKft1vgwOF+A27F5n/39SfSA06wWMSshefJo4MtNEo58K4tC1bCML79U07tS8WPXLPpJW+E/
 O4hhx2V7HSxL7F7kKfXQ8t2TPfZY1x5EceWABxzowhDoM1YjGoddabxfD622kNhm02F4PgE
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.619,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 06/08/2021 à 16:39, Alyssa Ross a écrit :
> This would previously give error messages like
> 
>> Received unexpected msg type.Expected 0 received 1
> 
> Signed-off-by: Alyssa Ross <hi@alyssa.is>
> ---
>  hw/virtio/vhost-user.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 29ea2b4fce..ad9fc40271 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -429,7 +429,7 @@ static int process_message_reply(struct vhost_dev *dev,
>      }
>  
>      if (msg_reply.hdr.request != msg->hdr.request) {
> -        error_report("Received unexpected msg type."
> +        error_report("Received unexpected msg type. "
>                       "Expected %d received %d",
>                       msg->hdr.request, msg_reply.hdr.request);
>          return -1;
> 
> base-commit: bccabb3a5d60182645c7749e89f21a9ff307a9eb
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

