Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C778824A88A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 23:33:42 +0200 (CEST)
Received: from localhost ([::1]:47258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8ViH-0000u2-D8
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 17:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1k8Vh6-0008T7-5V
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 17:32:28 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:54686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1k8Vh1-0000Qx-Ra
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 17:32:25 -0400
Received: by mail-wm1-x332.google.com with SMTP id d190so3466397wmd.4
 for <qemu-devel@nongnu.org>; Wed, 19 Aug 2020 14:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=NEWkDaxA8F22JoRwitEicVVG7tfq6cUU1Y3rja7lNtA=;
 b=X+JFEd0NPhwB5icMXhs+rRBYmpFSFsUaX1pTbmLWgwAY7RV8z7VipgVk7IIxps3bBZ
 FvfmOyP5PIGLiDlthaHD3mB6tZW/3fzJsd3USwrhB2unI0NjiWoloFig9GiFGDty7MPl
 pPwQZO9Hp2s7jFH97rRDlL57ZJrF7GI7zoKgGVEQF4IwxzhLgocbPim5Fyx71N0RPjRh
 8ZYMMjRvuX5aL1rUlwtx72oqrR1RnEXH+/au3IU5RVXkXJSOqW8odpgxYpULBdX6iAvu
 APt9CFhNEHKCdOHBemQVHiIqJ2IoG5Cvae5JGOD98baf8r/9PXdqgGwLpFkgvyEXh7r4
 5fhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=NEWkDaxA8F22JoRwitEicVVG7tfq6cUU1Y3rja7lNtA=;
 b=Yrmi9MUCzzftqkLZR6+3ORHkLQ63DL1iHOFMfB2SIjjbfbLW5q+PRkCjWm3ylIMubn
 CrMVmOG7Wp3KywiSmwiOprsOrymaiWwaVxkPHh/XFyEVQzMRYLKlvhxh0xq/SX/HtAeW
 hVEnXb2WVv9bILORHCHbH5uoA+fEqfTyDgAjrw98S89N6Li6/XcaCEsA6fcySR15Q2fU
 oe+TvMYCFAAaSwqsM+Ec1msh/mdX7yXlKEY7KgSpKYTE+ZbwobxvGwlSbagszgZP6asG
 hnXMaDjQEwHLuAWlfp8OorFFvd7OrQE0Pv+4MSY2KswY1hyjrysS1k1vAxQrXt/Z+/D1
 R7FQ==
X-Gm-Message-State: AOAM533giW2D6k/arwgnZiSH403Se0zJgaxMU4aCOjMvbS5K041vEksY
 zou/PmWNzBOTtCo1YGgevBHaR369AM3xVw==
X-Google-Smtp-Source: ABdhPJzCMYg6cxurnnFhhhYigPy9qCzrtWKyby+9Pid8VAvAPOgeM75U0zHoFhteB6Ey+lPh+Hm45Q==
X-Received: by 2002:a05:600c:4152:: with SMTP id
 h18mr223139wmm.132.1597872741168; 
 Wed, 19 Aug 2020 14:32:21 -0700 (PDT)
Received: from [127.0.1.1] ([197.58.131.214])
 by smtp.gmail.com with ESMTPSA id v12sm207501wri.47.2020.08.19.14.32.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 14:32:20 -0700 (PDT)
Message-ID: <5f3d9a64.1c69fb81.58fa8.0979@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============4921522486926081046=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 19 Aug 2020 23:32:15 +0200
Subject: [REPORT] Nightly Performance Tests - Wednesday, August 19, 2020
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

--===============4921522486926081046==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-08-19 21:00:01
End Time (UTC)   : 2020-08-19 21:32:15
Execution Time   : 0:32:14.021998

Status           : SUCCESS

--------------------------------------------------------
            SUMMARY REPORT - COMMIT 672b2f26
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 118 484 879       -----       -----
alpha              1 838 407 216       -----       -----
arm                7 887 992 884       -----       -----
hppa               4 124 996 474       -----       -----
m68k               2 453 421 671       -----       -----
mips               1 812 636 995       -----       -----
mipsel             1 947 725 352       -----       -----
mips64             1 862 495 613       -----       -----
mips64el           1 984 211 702       -----       -----
ppc                2 394 319 834       -----       -----
ppc64              2 488 040 622       -----       -----
ppc64le            2 470 198 016       -----       -----
riscv64            1 367 774 718       -----       -----
s390x              3 058 498 362       -----       -----
sh4                2 278 490 061       -----       -----
sparc64            3 186 999 246       -----       -----
x86_64             1 734 475 394       -----       -----
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 019 613 303       -----       -----
alpha              3 078 110 233       -----       -----
arm               15 982 079 823       -----       -----
hppa               7 012 014 505       -----       -----
m68k               3 914 631 319       -----       -----
mips               2 979 137 836       -----       -----
mipsel             3 141 391 810       -----       -----
mips64             3 163 713 203       -----       -----
mips64el           3 314 105 619       -----       -----
ppc                4 692 148 212       -----       -----
ppc64              4 875 585 404       -----       -----
ppc64le            4 859 857 200       -----       -----
riscv64            2 150 267 230       -----       -----
s390x              4 455 507 359       -----       -----
sh4                3 816 841 775       -----       -----
sparc64            4 399 783 149       -----       -----
x86_64             2 441 371 746       -----       -----
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 177 687 656       -----       -----
alpha              1 462 693 182       -----       -----
arm                8 048 440 634       -----       -----
hppa               5 053 362 217       -----       -----
m68k               1 683 346 196       -----       -----
mips               1 473 265 047       -----       -----
mipsel             1 475 326 892       -----       -----
mips64             1 683 560 350       -----       -----
mips64el           1 663 467 060       -----       -----
ppc                1 978 581 291       -----       -----
ppc64              2 160 088 877       -----       -----
ppc64le            2 151 841 575       -----       -----
riscv64            1 323 226 597       -----       -----
s390x              2 880 509 792       -----       -----
sh4                1 938 787 291       -----       -----
sparc64            2 768 217 627       -----       -----
x86_64             1 521 726 675       -----       -----
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 408 042 295       -----       -----
alpha              3 009 129 018       -----       -----
arm                8 453 187 175       -----       -----
hppa               3 334 593 464       -----       -----
m68k               3 309 165 600       -----       -----
mips               2 252 644 394       -----       -----
mipsel             3 166 010 232       -----       -----
mips64             2 266 660 274       -----       -----
mips64el           3 179 408 969       -----       -----
ppc                3 108 563 525       -----       -----
ppc64              3 186 404 684       -----       -----
ppc64le            3 186 105 591       -----       -----
riscv64            1 218 230 013       -----       -----
s390x              2 715 954 030       -----       -----
sh4                3 330 300 193       -----       -----
sparc64            3 197 860 268       -----       -----
x86_64             1 244 922 914       -----       -----
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              595 215 814       -----       -----
alpha                369 955 794       -----       -----
arm                  735 842 738       -----       -----
hppa                 666 414 556       -----       -----
m68k                 406 857 412       -----       -----
mips                 497 082 899       -----       -----
mipsel               497 032 468       -----       -----
mips64               478 686 174       -----       -----
mips64el             462 210 845       -----       -----
ppc                  338 165 176       -----       -----
ppc64                390 046 801       -----       -----
ppc64le              390 236 162       -----       -----
riscv64              348 989 619       -----       -----
s390x                491 496 329       -----       -----
sh4                  399 095 487       -----       -----
sparc64              490 124 541       -----       -----
x86_64               399 613 899       -----       -----
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 645 742 637       -----       -----
alpha              1 899 562 379       -----       -----
arm                8 113 107 429       -----       -----
hppa               3 098 469 739       -----       -----
m68k               4 302 051 049       -----       -----
mips               2 060 965 462       -----       -----
mipsel             2 061 404 232       -----       -----
mips64             1 933 231 416       -----       -----
mips64el           1 930 636 000       -----       -----
ppc                2 673 960 745       -----       -----
ppc64              2 623 577 315       -----       -----
ppc64le            2 580 240 728       -----       -----
riscv64            1 575 021 518       -----       -----
s390x              2 437 147 903       -----       -----
sh4                2 520 101 855       -----       -----
sparc64            3 882 349 298       -----       -----
x86_64             1 969 776 338       -----       -----
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 131 273 662       -----       -----
alpha              1 460 090 651       -----       -----
arm                3 372 526 755       -----       -----
hppa               2 196 131 815       -----       -----
m68k               1 779 454 745       -----       -----
mips               1 500 097 569       -----       -----
mipsel             1 502 804 063       -----       -----
mips64             1 497 347 136       -----       -----
mips64el           1 476 627 156       -----       -----
ppc                1 667 589 417       -----       -----
ppc64              1 779 203 387       -----       -----
ppc64le            1 728 565 582       -----       -----
riscv64            1 288 897 227       -----       -----
s390x              2 113 929 796       -----       -----
sh4                1 878 433 512       -----       -----
sparc64            3 353 723 284       -----       -----
x86_64             1 751 619 062       -----       -----
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 529 811 267       -----       -----
alpha              1 793 314 577       -----       -----
arm                7 155 792 109       -----       -----
hppa               4 595 956 496       -----       -----
m68k               2 294 974 463       -----       -----
mips               2 113 124 208       -----       -----
mipsel             2 110 049 468       -----       -----
mips64             1 967 925 447       -----       -----
mips64el           1 950 320 901       -----       -----
ppc                2 428 056 923       -----       -----
ppc64              2 404 890 978       -----       -----
ppc64le            2 385 487 957       -----       -----
riscv64            1 563 271 793       -----       -----
s390x              3 934 075 315       -----       -----
sh4                2 097 732 542       -----       -----
sparc64            4 131 589 952       -----       -----
x86_64             2 864 598 485       -----       -----
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 440 492 400       -----       -----
alpha              1 634 401 901       -----       -----
arm               11 242 966 409       -----       -----
hppa               7 043 029 003       -----       -----
m68k               1 936 892 588       -----       -----
mips               1 624 778 552       -----       -----
mipsel             1 627 783 657       -----       -----
mips64             1 908 840 910       -----       -----
mips64el           1 896 917 069       -----       -----
ppc                2 267 493 386       -----       -----
ppc64              2 484 527 533       -----       -----
ppc64le            2 479 249 335       -----       -----
riscv64            1 474 293 752       -----       -----
s390x              5 439 366 376       -----       -----
sh4                2 246 627 833       -----       -----
sparc64            3 272 345 849       -----       -----
x86_64             1 682 174 033       -----       -----
--------------------------------------------------------


</pre></body></html>

--===============4921522486926081046==--

