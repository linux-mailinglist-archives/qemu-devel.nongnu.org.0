Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D2D531144
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 16:13:12 +0200 (CEST)
Received: from localhost ([::1]:45840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt8o3-0001xg-Am
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 10:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nt8kf-0000ay-Cq
 for qemu-devel@nongnu.org; Mon, 23 May 2022 10:09:41 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:39001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nt8kX-0006wI-RS
 for qemu-devel@nongnu.org; Mon, 23 May 2022 10:09:37 -0400
Received: from [192.168.100.1] ([82.64.211.94]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MxUfh-1ndO4m1oL3-00xobm; Mon, 23 May 2022 16:09:29 +0200
Message-ID: <fdafc45b-2ade-ed4d-6d1e-76a72342c5bc@vivier.eu>
Date: Mon, 23 May 2022 16:09:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] linux-user/syscall.c: fix build without RLIMIT_RTTIME
Content-Language: fr
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: qemu-devel@nongnu.org
References: <20220523105239.1499162-1-fontaine.fabrice@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220523105239.1499162-1-fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:V5YRbg1CTIgB9U7T7V2YCULwYJoSP9iunVxAi6XCOgjs9YCqrCD
 qDR/yQOstfHhyFDM0lITqL8/j+4rc9MilTRzKLnuGQS7IZ/EArI8OB7x3uEFsjX3kqRG8YP
 6LYixBJ950FDgqRgUUy0vycEU6SNciLFPBk8VwbdI9z1a0qFLsPlZ30CqCzkW2DNg+U8rqf
 d5Msx5m+Atr+/KZ/Ar4gw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:P+x7alnM354=:i6UKq1JiIzpmR6ISx6iIIO
 5HkriSoaOHqBxMNgwo+vUZBbON+1romc/h0QX1JEWgbHRM2lzYV41Z8Qj1zAyeeDk2VPLgUNx
 ikI1lCnTs6x79ffLIMxeqigU/UEcbsU/4J5frXyVAzErepCO57LPI1kBJWvjeoIYw2NvZ/jkP
 Qasx1HJ9A/wf37GJ9HfDv0lxja+s5VgZlLdCKICsXA4Yh78sURUjfsuq2JkYMb7GgY0T54rnn
 voDLlaA904e8igx9GpFBWXzqfsnTXBJ1Tihx/Ql43mprsakWiSSP1CEKChAYWj/L2Wb7I7jZq
 inlZqdGL+AHW8cwIOZG0NUEzHNo64/DFdBy66UqcI9ROaqoZFg3nciBN2JY3pZRM5ahGQnvCR
 MG+4ERI9cLXQY8llD9zUhub2bRFaO/juNj0ODq1k+P2qZtAg6/EzPldeOlM+8hiBwUUNgou1p
 zuBNT5hGWW6VuhVzQ761dO9TQG+6v7Km2iCoa3XoxN4wD5axTJRU99OoPMuo4OK2iNIhmNDdr
 0ajInadW/wosuGSXq8u9VwWmbHru3+zkQr0ivvczwxdPHNamIIOPJWiCa4OjQe71bYYyjsceQ
 zDqNGkWY9gb/sUvbgNYCGnA3ValXHJjo0xeFrMM8ASuQyWDzlrs6dbD1s7YDJWo+Ko969bvfq
 GTar/t6zy9wj4drEXJsuy43PrMMdJWzl+v7oba24o4vH+FEjZ6IVNYzS/IQwWTY/clL7VGhbb
 cPQMtDeFDgNTc6uTSQY/oGKahrWGhqvwQjOcWA==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 23/05/2022 à 12:52, Fabrice Fontaine a écrit :
> RLIMIT_RTTIME is not provided by uclibc-ng or by musl prior to version
> 1.2.0 and
> https://github.com/bminor/musl/commit/2507e7f5312e79620f6337935d0a6c9045ccba09
> resulting in the following build failure since
> https://git.qemu.org/?p=qemu.git;a=commit;h=244fd08323088db73590ff2317dfe86f810b51d7:
> 
> ../linux-user/syscall.c: In function 'target_to_host_resource':
> ../linux-user/syscall.c:1057:16: error: 'RLIMIT_RTTIME' undeclared (first use in this function); did you mean 'RLIMIT_NOFILE'?
>   1057 |         return RLIMIT_RTTIME;
>        |                ^~~~~~~~~~~~~
>        |                RLIMIT_NOFILE
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/22d3b584b704613d030e1ea9e6b709b713e4cc26
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Laurent Vivier):
>   - Use an ifdef block instead of defining RLIMIT_RTTIME
> 
>   linux-user/syscall.c | 2 ++
>   1 file changed, 2 insertions(+)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

