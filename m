Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E9D36FE66
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 18:21:37 +0200 (CEST)
Received: from localhost ([::1]:54520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcVtV-0004d1-EP
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 12:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcVbD-0007jY-5Y; Fri, 30 Apr 2021 12:02:39 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:42071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcVb8-0005OF-2V; Fri, 30 Apr 2021 12:02:36 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MXY2Z-1m4sWL03pP-00Z3JK; Fri, 30 Apr 2021 18:02:26 +0200
Subject: Re: [PATCH v2] Fix typo in CFI build documentation
To: Serge Guelton <sguelton@redhat.com>, qemu-devel@nongnu.org
References: <20210430150745.GA1401713@sguelton.remote.csb>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <72c36ee1-0ac2-ddd4-04df-3c0c5dca8451@vivier.eu>
Date: Fri, 30 Apr 2021 18:02:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430150745.GA1401713@sguelton.remote.csb>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EeKvir8zx7fofgILZIGhbo/aga3wKMK2LObaVkRkY+fwY4fIRpZ
 YOOo2vv1NiVDre6Jo6l0L3XNWHzhUmY1Vp7M3lET0gFL2YxW2eXQcZ8CRTMjk/u5IyslYL1
 hw7bQwSp7gLRIC4GA0QNcchAH/FoCRvWAV3B2TNyUIQcACZoD2EbkQQNNN/pP2z7/DYgTxu
 ZYDPqz/qz6UXNKPbG4VOQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:z19el3uIuQo=:+3vodWCuCf8xgzBGJRELQg
 bLsMqVubM6a/7elrB1O+IFA9r7VVZZkEV92LlcVFutpDB2Ow+5Lx7uNtSRY9lTZ0EguCwLRD8
 cXcnrWOlsPySnNWwWNMasyFc2+PngZmaK3P0A/lG/khzOEId8KNIAyL8YqjapzWtQ3LHloTfU
 /baDmbVjDxQZnzRVLpKdn8Up5Ghmw9mNJ3kguciDew+NrNg513kLNQIHJkae3/Lc0GfzPtbQI
 yHsfF+srmWIpih0ZJzibRtb6IRcqLRtrCcLcSBZxCDOcTi3nb9W5FBLlUACnh5IfW0f5Cv05Q
 6piLE+XKrDiYJyCNRPCamRiQwK7IdsqBQ4y1xR3oFGykgaXMpI19pytxU2oqDcngoCDiSKJsx
 yKvW3NfXenlQGEp52Qia0NhWdbnUJm2q26t6stOzj5cZD2j9lLzvEuIV9KD+DD4/tI1S5KiZj
 OmSUWHjyEALNJCiZ6ohoAxcfUfgy3A5IFRZ8kYXe9sl/916ktV2xd1i6mkfU9pSRnOj+kAXft
 kb6Oo9o0aHpVc31rklUKzg=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/04/2021 à 17:07, Serge Guelton a écrit :
> Signed-off-by: Serge Guelton <sguelton@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  docs/devel/control-flow-integrity.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/devel/control-flow-integrity.rst b/docs/devel/control-flow-integrity.rst
> index d89d707..e6b73a4 100644
> --- a/docs/devel/control-flow-integrity.rst
> +++ b/docs/devel/control-flow-integrity.rst
> @@ -39,7 +39,7 @@ later).
>  Given the use of LTO, a version of AR that supports LLVM IR is required.
>  The easies way of doing this is by selecting the AR provided by LLVM::
>  
> - AR=llvm-ar-9 CC=clang-9 CXX=lang++-9 /path/to/configure --enable-cfi
> + AR=llvm-ar-9 CC=clang-9 CXX=clang++-9 /path/to/configure --enable-cfi
>  
>  CFI is enabled on every binary produced.
>  
> @@ -131,7 +131,7 @@ lld with version 11+.
>  In other words, to compile with fuzzing and CFI, clang 11+ is required, and
>  lld needs to be used as a linker::
>  
> - AR=llvm-ar-11 CC=clang-11 CXX=lang++-11 /path/to/configure --enable-cfi \
> + AR=llvm-ar-11 CC=clang-11 CXX=clang++-11 /path/to/configure --enable-cfi \
>                             -enable-fuzzing --extra-ldflags="-fuse-ld=lld"
>  
>  and then, compile the fuzzers as usual.
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


