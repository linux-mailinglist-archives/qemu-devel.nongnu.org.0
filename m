Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE88415B7D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 11:53:29 +0200 (CEST)
Received: from localhost ([::1]:35254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTLQ0-0002OI-HY
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 05:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mTLOH-0000pn-6v; Thu, 23 Sep 2021 05:51:41 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:50843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mTLOF-0005vI-FN; Thu, 23 Sep 2021 05:51:40 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MQMm9-1mGMyv0zM9-00MKpS; Thu, 23 Sep 2021 11:51:36 +0200
Subject: Re: [PATCH] docs/nvdimm: Update nvdimm option value in machine example
To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, xiaoguangrong.eric@gmail.com
References: <20210726071145.150832-1-pankaj.gupta.linux@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <7dc3c0eb-a22a-3d2c-9301-563c3ea9ed94@vivier.eu>
Date: Thu, 23 Sep 2021 11:51:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726071145.150832-1-pankaj.gupta.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:M+Z9UBfCZwS6lDXWY7ZKLCOQjrK13tkXvrlk3/56tUqxNyZ4zoC
 CEMNGfvhhjZFDdhjKLFOp7x3TwfjTcY1sQ+F0pP6PA8NbXiBHyVjykJ3kQSsZNev4nuaj3g
 MVLXrqGhHm/ynltB0k34PuCwKuakfZjLZF2gfDYLH6KeLFJZVOk4K6/lLqgl87/gciYCbAE
 zk9XmWZESs6gNrxj3S4Hw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z0USoIwqDFw=:TCFlMPQDfqGfuM5GIW5Bn/
 5AozdZ+29aPvW0R/lQOGWbqEnDuU0cPsYW/7BPIJXYRUdRiFHHdIfbUWQzI40ijeH9YvsY005
 ii7VKFk/Vwx8zWQxAfBqEgnQgT15MYQ0lxVXIJxWmF0XBeBaRBAdztaMzhsMICyK/jHFXmgqO
 viIdM4Hjfb1Ks0Yl0Cm1zLvDiV+wW1Atn+kbTNhzkAhR4gGAAq6vpQL8OYLsfz8SgmLsX6gZ1
 /nHlY6buOwRPIe/VH6z66zsb0I7OuBJLoW/E1jzmCNh+TV1iazNjEQ37m4/2siB+If5H81s8N
 +UmyFOc97r48AJu8YZoIflZeoV5Qh8lZW7Q/WQruzFxU0CWKvfyLI9R9qAJjMxKgfrxq4S3ca
 uoUChaleBQyzaBgGyQJe5kfxY6tzwKJJC3DGJp7bb7NDy94dKoigLJTGvj+vPTl461PZDWR7R
 eqFD7eki4XKE18jqNKnrLWeRj3WechVvcibb7G5ConuQqHP8ku3qjuBHGwJTWeAQCcujI3pkr
 bQUAQWlo5CzgLY5MgbP2A/NJM8WVehSGT+2Mut7mbOmnsHZlLSbVEMrmMqQOj2+m5DnfWahQ0
 XvwcZ3jk8bTlUPIR97B7+uFilLMgXzcTSdEQ5TPSmH5wzWOEnUsnUOrpxTKea0WPlOJyDKQBb
 lqUDF1YLqxTNFSeaMnp7acJaoY+HF5JNaGktHMm3rcvixXn9dDEEjSc3xgjxx0YDlorDQFHnR
 KWfUYbmm2HnbcOsXVyvrLfvaYMDssdO+aObQ2w==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
 Pankaj Gupta <pankaj.gupta@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/07/2021 à 09:11, Pankaj Gupta a écrit :
> Update nvdimm option value in example command from "-machine pc,nvdimm"
> to "-machine pc,nvdimm=on" as former complains with the below error:
> 
> "qemu-system-x86_64: -machine pc,nvdimm: Expected '=' after parameter 'nvdimm'"
> 
> Signed-off-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> ---
>  docs/nvdimm.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/nvdimm.txt b/docs/nvdimm.txt
> index 0aae682be3..fd7773dc5a 100644
> --- a/docs/nvdimm.txt
> +++ b/docs/nvdimm.txt
> @@ -15,7 +15,7 @@ backend (i.e. memory-backend-file and memory-backend-ram). A simple
>  way to create a vNVDIMM device at startup time is done via the
>  following command line options:
>  
> - -machine pc,nvdimm
> + -machine pc,nvdimm=on
>   -m $RAM_SIZE,slots=$N,maxmem=$MAX_SIZE
>   -object memory-backend-file,id=mem1,share=on,mem-path=$PATH,size=$NVDIMM_SIZE,readonly=off
>   -device nvdimm,id=nvdimm1,memdev=mem1,unarmed=off
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

cc: qemu-trivial

