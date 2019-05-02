Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C01111670
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 11:17:50 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48122 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hM7qf-0006bp-Io
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 05:17:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hM7ox-0005p3-4q
	for qemu-devel@nongnu.org; Thu, 02 May 2019 05:16:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hM7on-0008TO-1J
	for qemu-devel@nongnu.org; Thu, 02 May 2019 05:15:55 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:48183)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hM7ok-0008Rc-VL; Thu, 02 May 2019 05:15:51 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
	1MploR-1gz7Hj1k8T-00qDUu; Thu, 02 May 2019 11:15:46 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
References: <20190427161322.24642-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <8f7591a2-5da4-1403-ecfd-b64ca4ec5ab3@vivier.eu>
Date: Thu, 2 May 2019 11:15:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190427161322.24642-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2+sVPbIL+EkvqikqU/sJrQ/0Gz1x08ALYqb4dt/2a/iTTM2pwGa
	iYW765cOCdCgLvAbLQ1SFgxDNv4AT4KfBeeKy2U1MkwbKebCcgEB5hVedrPgdYvgt4kk6ys
	1ec+9ayZSgoZeuGJzaH+DLHJ1vkcj+UjatgMK5Cj9RBF1bsMMiAEASQLi+nDjJkwgj7S1Mf
	+b3FtF2UYpJt4q7LrtkTQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wFw1KK7TqOo=:0Sa3qJVnaYAQqa6nXHU+xw
	6ArAVcPl0YSnUFeNiZ6QmqvWMIC5iZL9Yh1k1EvvXTwBzYXpHnhWPlGhDaFTuZvhPeamMZa5F
	7FacFS72TJUhEcmDVgHRQoa6RBmCCHLWD2MRhE68zRHMi3J1/W//zF1DfvHmV9o7M/X0+74UJ
	IMnGEJE37enMrBhkWUPgb0+tWv8IfTXEbblc6oVEnRu9P8E4cFIySW/o0bW3GK2iz3zUsA15M
	er6tH3IHNd7C3TsvFLOyetDzPRDeBUzSev53SziGnDVHKzzoIzvxv7qsAdVeIo+YValtOwkfL
	xMItbzsrZoFJQukomDlXfnX9c5261uKHuteOMKr9N6+Q5NxbobphPuY5G9+ERGy+i2qpihsX+
	2WjxEwZLpTGOAys6Nv8P+VC+Ff1ds2NUTcz3g28/znR9UGGgrrrtrxmLxhr7sg3LmUG3kAe74
	EIQ+awAyvnm1bhmAnPc/OidlcrEpqFKEn9cL3Ju23l1wXR+mfhMYhzzYPiPDaqenX3GMzcmp/
	KYl5UfDrwPkkk1KdQUZ3tlX4GHpBPHMAbFRBfhoWbWEXaq4QScJQ7K5nvGxieHgPno/Z3cD9W
	bcn9nZtxATE4maS0QJ2FnjjVUfYdZVTMeL2+xwJBFiiCFVIPp60j7ZU0eNZzLPmSOaWT7YLft
	twSrX5nXCaVqdEbME3DWANKKCTsCJuBR5fl6ges6AraWcyk1kGfitfYLbT9UCMCl3XdLUN3S4
	lMee7d01p7s8AJcU9XdAxg8gPxl120i3gpseGobLKzYv/QsFQCodwg5wyVc=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-devel] [Qemu-trivial] [PATCH] Makefile: Let the 'clean'
 rule remove qemu-ga.exe on Windows hosts
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/04/2019 18:13, Philippe Mathieu-Daudé wrote:
> Commit 48ff7a625b36 added the QEMU Guest Agent tool with the
> optional ".exe" suffix for Windows hosts, but forgot to use
> this suffix in the 'clean' rule. Calling this rule let a dangling
> executable in the build directory.
> Correct this by using the proper optional suffix.
> 
> Fixes: 48ff7a625b36
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 626a04d305c..07bfa26536a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -639,7 +639,7 @@ clean:
>  		! -path ./roms/edk2/BaseTools/Source/Python/UPT/Dll/sqlite3.dll \
>  		-exec rm {} +
>  	rm -f $(edk2-decompressed)
> -	rm -f $(filter-out %.tlb,$(TOOLS)) $(HELPERS-y) qemu-ga TAGS cscope.* *.pod *~ */*~
> +	rm -f $(filter-out %.tlb,$(TOOLS)) $(HELPERS-y) qemu-ga$(EXESUF) TAGS cscope.* *.pod *~ */*~
>  	rm -f fsdev/*.pod scsi/*.pod
>  	rm -f qemu-img-cmds.h
>  	rm -f ui/shader/*-vert.h ui/shader/*-frag.h
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

