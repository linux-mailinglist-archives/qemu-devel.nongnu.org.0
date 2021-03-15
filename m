Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9276533C9D0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 00:14:39 +0100 (CET)
Received: from localhost ([::1]:58966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLwQ2-0000U5-AN
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 19:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1lLwL2-0002Q9-UU
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:09:28 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:44268 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1lLwL1-0002Ef-6P
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:09:28 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id D9F56412DB;
 Mon, 15 Mar 2021 23:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-transfer-encoding:content-disposition
 :content-type:content-type:mime-version:references:message-id
 :subject:subject:from:from:date:date:received:received:received;
 s=mta-01; t=1615849764; x=1617664165; bh=dZVpUlKRikrA84JNsSO6s7
 kjWQRWdaOKi/W1R7vNfEg=; b=JftzrAxcmlwJIR85XVTRXX/tIbh2z+LHOAHhvI
 CeqKMiE3oy49ihwaFqfIVjyYnS7euAweGSk7k1jNBRCzuDHOvREBJXVDlh+pBdm5
 oSL5VeMEkOdPqFftcyFUbhI8bC7hX2ejld4/KQJKkabrkCDsldkslxXdc/j963va
 Hdgbo=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RX8DU2FvWLUF; Tue, 16 Mar 2021 02:09:24 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id A4F97412D8;
 Tue, 16 Mar 2021 02:09:24 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 16
 Mar 2021 02:09:24 +0300
Date: Tue, 16 Mar 2021 02:09:23 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 01/29] meson: Split out tcg/meson.build
Message-ID: <YE/pI2fHqNyOR1Mn@SPB-NB-133.local>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
 <20210314212724.1917075-2-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210314212724.1917075-2-richard.henderson@linaro.org>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Mar 14, 2021 at 03:26:56PM -0600, Richard Henderson wrote:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>

Thanks,
Roman

>  meson.build     |  9 ++-------
>  tcg/meson.build | 13 +++++++++++++
>  2 files changed, 15 insertions(+), 7 deletions(-)
>  create mode 100644 tcg/meson.build
> 
> diff --git a/meson.build b/meson.build
> index a7d2dd429d..742f45c8d8 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1936,14 +1936,8 @@ specific_ss.add(files('cpu.c', 'disas.c', 'gdbstub.c'), capstone)
>  specific_ss.add(files('exec-vary.c'))
>  specific_ss.add(when: 'CONFIG_TCG', if_true: files(
>    'fpu/softfloat.c',
> -  'tcg/optimize.c',
> -  'tcg/tcg-common.c',
> -  'tcg/tcg-op-gvec.c',
> -  'tcg/tcg-op-vec.c',
> -  'tcg/tcg-op.c',
> -  'tcg/tcg.c',
>  ))
> -specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('disas/tci.c', 'tcg/tci.c'))
> +specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('disas/tci.c'))
>  
>  subdir('backends')
>  subdir('disas')
> @@ -1953,6 +1947,7 @@ subdir('net')
>  subdir('replay')
>  subdir('semihosting')
>  subdir('hw')
> +subdir('tcg')
>  subdir('accel')
>  subdir('plugins')
>  subdir('bsd-user')
> diff --git a/tcg/meson.build b/tcg/meson.build
> new file mode 100644
> index 0000000000..84064a341e
> --- /dev/null
> +++ b/tcg/meson.build
> @@ -0,0 +1,13 @@
> +tcg_ss = ss.source_set()
> +
> +tcg_ss.add(files(
> +  'optimize.c',
> +  'tcg.c',
> +  'tcg-common.c',
> +  'tcg-op.c',
> +  'tcg-op-gvec.c',
> +  'tcg-op-vec.c',
> +))
> +tcg_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('tci.c'))
> +
> +specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
> -- 
> 2.25.1
> 

