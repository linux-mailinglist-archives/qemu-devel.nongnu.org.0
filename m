Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E1C6B80DC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 19:39:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbn3b-0006Pj-3f; Mon, 13 Mar 2023 14:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pbn3R-0006PF-MS; Mon, 13 Mar 2023 14:37:57 -0400
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pbn3P-0008OY-Rx; Mon, 13 Mar 2023 14:37:53 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MLQl3-1psUp0421T-00IYTF; Mon, 13 Mar 2023 19:37:38 +0100
Message-ID: <3a9bc837-9c77-aef2-cf26-b2213040629a@vivier.eu>
Date: Mon, 13 Mar 2023 19:37:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] MAINTAINERS: Remove CXL maintainer Ben Widawsky
Content-Language: fr
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, bwidawsk@kernel.org, Jonathan.Cameron@Huawei.com
References: <20230220212437.1462314-1-armbru@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230220212437.1462314-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9Z3lseaWR+7+T3lbPqzgKKLdnetuxSW8dz3iWmz20qws8fjvg70
 vznM0lPTQc5ypSB43Hy9PfEj7g/SftarECKeUxHeOEgEgZUiqMZctlghVhzax1D1MMjKK2j
 k9zLySNk900WtrL9z4uemkqqi7aphiA4RHUvFvzVWQNO1IV9uMhFU5PRA9/agaz1AjvN/rY
 ybsKQRlkcls8nOQ5WUazg==
UI-OutboundReport: notjunk:1;M01:P0:/EgkQGUOgjU=;7CbhuK5ZClWTMqLP9FUK1tlsil0
 gC5O4bEkE3KOjO22WDzfq954YAza5W+Uot1nMxMe4t00S0Ue2HR5y4rmjBGK0TUnWxqDgAwSy
 HaBxJ12NM8oPZGpwOzXUyQhnIflCU+kYo+GqzcYQ4y2LP5kJ8EiyP9i+aW0iFduyUOmZdDrTl
 zQ57kbBe/I5AcvA5n7wDCm8g9dw9H+R6wZyta0LOa/pGTOOVQ7gwuFQ7SLCGncA4xMlkYwuSd
 sXrLlT/m0Rvwj2KC5GI/9dAm1P/5R11UlWKV7eajV2mIs6PgiCPsi+qiEGNvIVSTiLwaNmEW5
 58/xOaSvSNmUtBqsixyk1jZMTuUAfE4l5Y1JT7qd3DFM2XGIFPfMWziB5VoxqzRi947kXTEYW
 +y0gMKRetqZjbwVnFHyJv7g29XVGOCvUN1BPJ8udI3P43Jihlvh0rT8VYdQPzUU+/WWdzqvQc
 TKwxN92gaCPAeT6PN2/12DxHgEYPhuAmy4DYMWbTJZh3iQp50Qs511V8p+Hk/yfnOdghzLI/b
 jxzLN0QucQYuJEcnpQMOVJkuEmZvXDKtSMgtW9LvRrutNZpeFIUDXh+GNhWQZ4iZYqkW9W/IB
 MhEDI1WQ9ICYbC46pwN7SaKNh613ZVNxB9/vJaIMtNvylr7/LtdE26Pb9d5KFO2SY3lpbVBji
 NLSPUf2y+WnpMDNw8isjsbkeZKoCLJv6ZDH7irBB9A==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 20/02/2023 à 22:24, Markus Armbruster a écrit :
> Ben is no longer with intel.  He told me he expected to get back to
> CXL, but it's not happening as quickly as he'd like, and that it's
> best to remove him as maintainer.  So let's do that.
> 
> Thank you for serving as maintainer, Ben!
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   MAINTAINERS | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fd54c1f140..c3e83a1a47 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2630,7 +2630,6 @@ T: git https://gitlab.com/jsnow/qemu.git jobs
>   T: git https://gitlab.com/vsementsov/qemu.git block
>   
>   Compute Express Link
> -M: Ben Widawsky <ben.widawsky@intel.com>
>   M: Jonathan Cameron <jonathan.cameron@huawei.com>
>   S: Supported
>   F: hw/cxl/

Applied to my trivial-patches branch.

Thanks,
Laurent

