Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B62F724C735
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 23:33:36 +0200 (CEST)
Received: from localhost ([::1]:43610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8sBj-00007N-Ox
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 17:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1k8sAX-00083k-Ht
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 17:32:21 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1k8sAV-0007K6-LW
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 17:32:21 -0400
Received: by mail-wm1-x332.google.com with SMTP id g75so18064wme.4
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 14:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=P0zezuYwsl4Ub0ondGNF4QYgUSM2f/GAmjqJxDb0mFE=;
 b=YkK9E5ukXawwQUKsMP7iebFt4ErVGo4qkqn5HxJJZPR5MD4jZO2SSJUU2zRSHjEzxf
 9sKDSXWhxm1QI6nSATABCinJYvN5HsaP7LKpN9/OoZMIbTiXOooLLKKLkw1aywTp/jRq
 xjCIDWofh5yvT8StLdvUt/NPjv0X/JhFJ9+pyZraEB4z1BJHVJrgPP9hD2FJI3uODJOx
 RwXXQHN8jNxmP/5CcjQDt5ZqxLm5C51Q7d79saMwI01EfobVmXHoFsrpon3jJi25jO65
 AJ01czhuvW6F2kcmofzRMdpmj24g2GZU2fN6TlxFI80aQ320ryAl4DYajpfsjt8BjgrP
 ziaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=P0zezuYwsl4Ub0ondGNF4QYgUSM2f/GAmjqJxDb0mFE=;
 b=slG83nM2xrs97OwnPw3ook56uhR9jDizeLqXtQZ7hO1AIwCAi5+bM8EFLi3ajLtcD2
 VqfDswUNZhAiMdW/jfL5oQ3b7OIQVMYhUDbXxR6MN1XQoIv6I7sKEEuP7HQMyRykAyla
 tKtIQF/PV6Lj7oynrRJ4cHWLeEq8MYiUG9N1El22jfwI32Il8mZH875eAF2Gi5bK1UUS
 NtAK+XQK1iGDZKlhPVfxsivxUvyJfDiLgTFgWlUVbz2X+nNNktjSEmOX+crNz4oIvKLJ
 0+36xDpfG/bCu2laZ9pv8ebUF1qUSpm2gJPoekR1msee22yL6Sh+nWzm2M6XHeSC1PpA
 oXMg==
X-Gm-Message-State: AOAM5306H0IVloK3Wze9Maqd/0mg8ep5OjVCkpGFV+T8mExpbylmfwD3
 LRqK8cteYRTBrYjHE2L9wBFWKlpbH5homw==
X-Google-Smtp-Source: ABdhPJxES/soP06acFLfFE9U8KLrk33OYfOt1yxAwXkkLuq96uJCt+KsB/OxtyRJNFsHLEZYwfVAtA==
X-Received: by 2002:a7b:cc90:: with SMTP id p16mr403595wma.79.1597959137358;
 Thu, 20 Aug 2020 14:32:17 -0700 (PDT)
Received: from [127.0.1.1] ([197.58.130.73])
 by smtp.gmail.com with ESMTPSA id y16sm6278415wrr.83.2020.08.20.14.32.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 14:32:16 -0700 (PDT)
Message-ID: <5f3eebe0.1c69fb81.b5f46.fc94@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============2562985701896350527=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 20 Aug 2020 23:32:14 +0200
Subject: [REPORT] Nightly Performance Tests - Thursday, August 20, 2020
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-wm1-x332.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, MIME_HTML_ONLY=0.1, MIME_HTML_ONLY_MULTI=0.001,
 MPART_ALT_DIFF=0.79, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--===============2562985701896350527==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-08-20 21:00:02
End Time (UTC)   : 2020-08-20 21:32:14
Execution Time   : 0:32:12.619200

Status           : SUCCESS

--------------------------------------------------------
            SUMMARY REPORT - COMMIT 1d806cef
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 118 485 222       -----       -----
alpha              1 838 408 248       -----       -----
arm                7 887 993 527       -----       -----
hppa               4 124 996 473       -----       -----
m68k               2 453 421 667       -----       -----
mips               1 812 637 399       -----       -----
mipsel             1 947 724 962       -----       -----
mips64             1 862 495 949       -----       -----
mips64el           1 984 211 712       -----       -----
ppc                2 394 319 184       -----       -----
ppc64              2 488 040 948       -----       -----
ppc64le            2 470 197 058       -----       -----
riscv64            1 367 774 062       -----       -----
s390x              3 058 498 052       -----       -----
sh4                2 278 490 066       -----       -----
sparc64            3 186 999 555       -----       -----
x86_64             1 734 476 045       -----       -----
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 019 613 403       -----       -----
alpha              3 078 112 827       -----       -----
arm               15 982 079 858       -----       -----
hppa               7 012 014 536       -----       -----
m68k               3 914 631 326       -----       -----
mips               2 979 140 437       -----       -----
mipsel             3 141 391 155       -----       -----
mips64             3 163 713 235       -----       -----
mips64el           3 314 105 619       -----       -----
ppc                4 692 148 198       -----       -----
ppc64              4 875 585 390       -----       -----
ppc64le            4 859 857 221       -----       -----
riscv64            2 150 267 316       -----       -----
s390x              4 455 507 331       -----       -----
sh4                3 816 841 768       -----       -----
sparc64            4 399 783 128       -----       -----
x86_64             2 441 371 739       -----       -----
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 177 687 621       -----       -----
alpha              1 462 695 786       -----       -----
arm                8 048 440 620       -----       -----
hppa               5 053 364 832       -----       -----
m68k               1 683 346 175       -----       -----
mips               1 473 265 060       -----       -----
mipsel             1 475 326 930       -----       -----
mips64             1 683 560 336       -----       -----
mips64el           1 663 469 689       -----       -----
ppc                1 978 578 627       -----       -----
ppc64              2 160 088 891       -----       -----
ppc64le            2 151 841 557       -----       -----
riscv64            1 323 226 632       -----       -----
s390x              2 880 507 254       -----       -----
sh4                1 938 789 917       -----       -----
sparc64            2 768 217 662       -----       -----
x86_64             1 521 729 332       -----       -----
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 408 042 276       -----       -----
alpha              3 009 131 612       -----       -----
arm                8 453 189 769       -----       -----
hppa               3 334 593 478       -----       -----
m68k               3 309 165 572       -----       -----
mips               2 252 645 028       -----       -----
mipsel             3 166 010 232       -----       -----
mips64             2 266 660 281       -----       -----
mips64el           3 179 406 382       -----       -----
ppc                3 108 563 532       -----       -----
ppc64              3 186 404 691       -----       -----
ppc64le            3 186 105 653       -----       -----
riscv64            1 218 229 955       -----       -----
s390x              2 715 956 652       -----       -----
sh4                3 330 297 592       -----       -----
sparc64            3 197 860 258       -----       -----
x86_64             1 244 925 550       -----       -----
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              595 218 431       -----       -----
alpha                369 956 371       -----       -----
arm                  735 845 339       -----       -----
hppa                 666 414 584       -----       -----
m68k                 406 857 405       -----       -----
mips                 497 082 879       -----       -----
mipsel               497 032 489       -----       -----
mips64               478 686 160       -----       -----
mips64el             462 210 873       -----       -----
ppc                  338 165 169       -----       -----
ppc64                390 046 780       -----       -----
ppc64le              390 236 183       -----       -----
riscv64              348 989 563       -----       -----
s390x                491 496 343       -----       -----
sh4                  399 092 910       -----       -----
sparc64              490 127 107       -----       -----
x86_64               399 613 913       -----       -----
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 645 742 702       -----       -----
alpha              1 899 562 414       -----       -----
arm                8 113 107 401       -----       -----
hppa               3 098 469 760       -----       -----
m68k               4 302 051 063       -----       -----
mips               2 060 962 854       -----       -----
mipsel             2 061 404 246       -----       -----
mips64             1 933 231 444       -----       -----
mips64el           1 930 636 028       -----       -----
ppc                2 673 960 801       -----       -----
ppc64              2 623 577 238       -----       -----
ppc64le            2 580 238 141       -----       -----
riscv64            1 575 018 956       -----       -----
s390x              2 437 147 917       -----       -----
sh4                2 520 099 219       -----       -----
sparc64            3 882 349 214       -----       -----
x86_64             1 969 776 345       -----       -----
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 131 273 727       -----       -----
alpha              1 460 090 581       -----       -----
arm                3 372 526 741       -----       -----
hppa               2 196 131 780       -----       -----
m68k               1 779 452 137       -----       -----
mips               1 500 100 220       -----       -----
mipsel             1 502 804 084       -----       -----
mips64             1 497 349 744       -----       -----
mips64el           1 476 629 792       -----       -----
ppc                1 667 586 760       -----       -----
ppc64              1 779 203 401       -----       -----
ppc64le            1 728 563 002       -----       -----
riscv64            1 288 897 199       -----       -----
s390x              2 113 927 244       -----       -----
sh4                1 878 436 169       -----       -----
sparc64            3 353 723 263       -----       -----
x86_64             1 751 616 454       -----       -----
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 529 811 244       -----       -----
alpha              1 793 311 962       -----       -----
arm                7 155 792 095       -----       -----
hppa               4 595 953 874       -----       -----
m68k               2 294 974 456       -----       -----
mips               2 113 124 187       -----       -----
mipsel             2 110 049 526       -----       -----
mips64             1 967 925 468       -----       -----
mips64el           1 950 320 873       -----       -----
ppc                2 428 056 951       -----       -----
ppc64              2 404 893 640       -----       -----
ppc64le            2 385 485 377       -----       -----
riscv64            1 563 271 744       -----       -----
s390x              3 934 075 322       -----       -----
sh4                2 097 732 559       -----       -----
sparc64            4 131 590 022       -----       -----
x86_64             2 864 598 415       -----       -----
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 440 492 374       -----       -----
alpha              1 634 404 432       -----       -----
arm               11 242 966 395       -----       -----
hppa               7 043 028 947       -----       -----
m68k               1 936 895 203       -----       -----
mips               1 624 778 531       -----       -----
mipsel             1 627 781 041       -----       -----
mips64             1 908 840 924       -----       -----
mips64el           1 896 914 447       -----       -----
ppc                2 267 493 438       -----       -----
ppc64              2 484 527 554       -----       -----
ppc64le            2 479 249 335       -----       -----
riscv64            1 474 291 133       -----       -----
s390x              5 439 366 355       -----       -----
sh4                2 246 630 399       -----       -----
sparc64            3 272 345 793       -----       -----
x86_64             1 682 176 613       -----       -----
--------------------------------------------------------


</pre></body></html>

--===============2562985701896350527==--

