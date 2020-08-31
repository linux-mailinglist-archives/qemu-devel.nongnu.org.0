Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BAC2583DD
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 00:05:34 +0200 (CEST)
Received: from localhost ([::1]:33638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCrvi-0006St-12
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 18:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kCru7-0005PG-Ot
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 18:03:55 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kCru5-0006fJ-Rk
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 18:03:55 -0400
Received: by mail-wr1-x42e.google.com with SMTP id z1so3940997wrt.3
 for <qemu-devel@nongnu.org>; Mon, 31 Aug 2020 15:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=8ImQhDrmvvLeeCLesQtq7uMB/DEbhtf8pVXOZ6VdyEo=;
 b=RsjE3ikqO0qvvh0AkOOHrvEBYGQ5KSHacS5imk5tf6wLl6kcpU8rwgoMOysZ1rqOmk
 I7r2tCctVJyiMogrbY2ZSRFHXlJG8JQhfsyWLAhrMep0X3ztUoPtl2Z5K/RyG+Marwol
 CEg6tcZeNS0JHkbqKdDtrk8A0AKvfwCgeP5MEUQiseWG8JK5ZYW+eQoBKQ1smBkacmqq
 bcYRrRPkYNtNOJZo6q8En2y/ULDgcbbL2FXyf8IeCVGKqvodxomQuw2iHASaYZ/+AycT
 KO0qg4wQGZFEUN/0efr5p4Oa7csaaT4E7gUa0+cBaeZ7maQus4NdQUGsgGHPdhGfA8lS
 0n8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=8ImQhDrmvvLeeCLesQtq7uMB/DEbhtf8pVXOZ6VdyEo=;
 b=ZhukAcj82nsibe8aHaILcKAtugRZ9GT+AGOBYUGESar9ebQPsxMa64qWWryQGE7WN5
 /jfiOFe6IfawlruzYDUKDuV7yMUniWavYU4+H8G7ODr6LWu4+IR+MPL1suUbpC6xWL60
 wZGS+zEmp2nUyhs0QeTG+Soun522Totxs4vvd9T01ZZnnYEgcQm8H/4z9vwbsYO9N9G2
 t2Ex0R1n6KqwoIAO6xbr+NzGsP4HlBSLz2aAnysHDRSvfDUuUz3/Jqyh+zo51165RPnF
 26GTylIknyYGG6Ls8Cmb4ZC0So2ifHlGSBGU7iTAV6xoA6GHsom2+qMJoKOHhcoA7pTR
 m2ig==
X-Gm-Message-State: AOAM532cpFTsiPannOmOAw+yR79Yhli2wOpbtWSMRUBntMBAyPr74WI9
 vSkaNHOggpgEXM8rPa0rBlfiDDywXSg=
X-Google-Smtp-Source: ABdhPJwGvkD43VGaUtheyLyfNnGLfqahg7FqrvSkNWVz9iXiGiGFm8zTOYfb9gmwR0cUWCHaGSw+mg==
X-Received: by 2002:adf:8445:: with SMTP id 63mr3257732wrf.375.1598911430960; 
 Mon, 31 Aug 2020 15:03:50 -0700 (PDT)
Received: from [127.0.1.1] ([41.40.226.181])
 by smtp.gmail.com with ESMTPSA id a20sm1093334wmm.40.2020.08.31.15.03.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 15:03:50 -0700 (PDT)
Message-ID: <5f4d73c6.1c69fb81.78c06.3c71@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============5467248030620143453=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 01 Sep 2020 00:03:18 +0200
Subject: [REPORT] Nightly Performance Tests - Monday, August 31, 2020
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-wr1-x42e.google.com
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

--===============5467248030620143453==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-08-31 21:30:01
End Time (UTC)   : 2020-08-31 22:03:18
Execution Time   : 0:33:17.321826

Status           : SUCCESS

Note:
Changes denoted by '-----' are less than 0.01%.

--------------------------------------------------------
            SUMMARY REPORT - COMMIT 2f4c51c0
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 158 385 359       -----     +1.695%
alpha              1 914 979 612       -----     +3.525%
arm                8 076 413 634       -----     +2.305%
hppa               4 261 661 111       -----     +3.163%
m68k               2 690 309 055       -----     +7.135%
mips               1 862 059 680       -----     +2.496%
mipsel             2 008 233 282       -----     +2.675%
mips64             1 918 655 917       -----     +2.819%
mips64el           2 051 564 413       -----     +3.026%
ppc                2 480 164 718       -----     +3.109%
ppc64              2 576 704 659       -----     +3.142%
ppc64le            2 558 877 496       -----     +3.174%
riscv64            1 406 728 405       -----     +2.652%
s390x              3 158 138 330       -----     +3.119%
sh4                2 364 470 690       -----     +3.332%
sparc64            3 318 827 000       -----     +3.861%
x86_64             1 775 830 837       -----     +2.158%
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 062 621 750       -----     +1.425%
alpha              3 191 877 533       -----     +3.696%
arm               16 357 167 482       -----     +2.347%
hppa               7 228 376 256       -----     +3.086%
m68k               4 294 075 581       -----     +9.693%
mips               3 051 474 700       -----     +2.429%
mipsel             3 231 542 693       -----      +2.87%
mips64             3 245 849 927       -----     +2.597%
mips64el           3 414 228 231       -----     +3.022%
ppc                4 914 550 541       -----      +4.74%
ppc64              5 098 144 074       -----     +4.565%
ppc64le            5 082 430 657       -----      +4.58%
riscv64            2 192 314 810       -----     +1.956%
s390x              4 584 587 603       -----     +2.898%
sh4                3 949 062 260       -----     +3.465%
sparc64            4 586 233 287       -----     +4.238%
x86_64             2 484 139 245       -----     +1.752%
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 210 231 707       -----     +1.495%
alpha              1 494 143 338       -----     +2.151%
arm                8 262 936 445       -----     +2.665%
hppa               5 207 294 158       -----     +3.046%
m68k               1 725 895 594       -----     +2.529%
mips               1 495 263 941       -----     +1.494%
mipsel             1 497 162 301       -----      +1.48%
mips64             1 715 451 246       -----     +1.895%
mips64el           1 695 220 602       -----      +1.91%
ppc                2 014 590 742       -----     +1.821%
ppc64              2 206 260 784       -----     +2.138%
ppc64le            2 198 026 833       -----     +2.147%
riscv64            1 354 923 960       -----     +2.397%
s390x              2 916 095 829       -----     +1.236%
sh4                1 990 558 292       -----     +2.671%
sparc64            2 874 269 435       -----     +3.831%
x86_64             1 554 029 269       -----     +2.123%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 412 288 804       -----     +0.303%
alpha              3 234 004 360       -----     +7.474%
arm                8 545 194 947       -----     +1.089%
hppa               3 483 504 965       -----     +4.466%
m68k               3 919 126 846       -----    +18.433%
mips               2 344 803 493       -----     +4.092%
mipsel             3 329 915 487       -----     +5.178%
mips64             2 359 059 099       -----     +4.076%
mips64el           3 343 651 131       -----     +5.166%
ppc                3 209 487 118       -----     +3.247%
ppc64              3 287 494 439       -----     +3.173%
ppc64le            3 287 198 420       -----     +3.173%
riscv64            1 221 649 630       -----     +0.281%
s390x              2 874 163 442       -----     +5.826%
sh4                3 543 969 389       -----     +6.416%
sparc64            3 426 223 792       -----     +7.142%
x86_64             1 248 962 283       -----     +0.326%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              598 717 432       -----     +0.591%
alpha                372 453 180       -----     +0.681%
arm                  746 596 649       -----     +1.464%
hppa                 674 250 222       -----     +1.179%
m68k                 410 585 251       -----     +0.922%
mips                 499 725 665       -----     +0.536%
mipsel               499 524 332       -----     +0.502%
mips64               481 568 401       -----     +0.602%
mips64el             465 063 294       -----      +0.62%
ppc                  341 365 065       -----     +0.953%
ppc64                393 786 349       -----     +0.963%
ppc64le              394 001 219       -----     +0.971%
riscv64              351 727 009       -----      +0.79%
s390x                494 450 814       -----     +0.604%
sh4                  402 696 743       -----     +0.906%
sparc64              495 989 605       -----     +1.199%
x86_64               402 975 725       -----     +0.845%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 709 719 984       -----     +2.419%
alpha              1 969 475 510       -----     +3.681%
arm                8 323 041 194       -----     +2.588%
hppa               3 188 294 457       -----     +2.899%
m68k               4 953 963 886       -----    +15.154%
mips               2 123 948 996       -----     +3.057%
mipsel             2 124 241 257       -----     +3.049%
mips64             1 999 063 586       -----     +3.406%
mips64el           1 996 431 134       -----     +3.409%
ppc                2 819 284 521       -----     +5.435%
ppc64              2 768 176 907       -----     +5.512%
ppc64le            2 724 831 044       -----     +5.604%
riscv64            1 638 357 728       -----     +4.023%
s390x              2 519 120 914       -----     +3.364%
sh4                2 595 570 535       -----     +2.995%
sparc64            3 989 021 943       -----     +2.748%
x86_64             2 033 515 902       -----     +3.237%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 193 439 293       -----     +2.918%
alpha              1 521 301 946       -----     +4.193%
arm                3 465 455 248       -----     +2.756%
hppa               2 280 012 786       -----      +3.82%
m68k               1 843 202 425       -----     +3.584%
mips               1 558 058 575       -----     +3.865%
mipsel             1 560 649 305       -----      +3.85%
mips64             1 563 433 272       -----     +4.413%
mips64el           1 542 684 102       -----     +4.475%
ppc                1 728 731 807       -----     +3.667%
ppc64              1 842 435 110       -----     +3.555%
ppc64le            1 791 848 543       -----     +3.662%
riscv64            1 348 913 382       -----     +4.657%
s390x              2 184 086 721       -----      +3.32%
sh4                1 946 518 660       -----     +3.625%
sparc64            3 452 247 125       -----     +2.938%
x86_64             1 813 589 325       -----     +3.539%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 592 234 313       -----     +2.468%
alpha              1 855 847 293       -----     +3.488%
arm                7 347 716 189       -----     +2.682%
hppa               4 758 733 609       -----     +3.542%
m68k               2 376 797 246       -----     +3.566%
mips               2 166 607 975       -----     +2.532%
mipsel             2 163 383 678       -----     +2.528%
mips64             2 029 266 678       -----     +3.118%
mips64el           2 011 634 964       -----     +3.145%
ppc                2 492 950 160       -----     +2.673%
ppc64              2 464 692 928       -----     +2.487%
ppc64le            2 445 279 088       -----     +2.506%
riscv64            1 625 064 521       -----     +3.954%
s390x              4 194 615 900       -----     +6.623%
sh4                2 164 147 732       -----     +3.167%
sparc64            4 299 524 035       -----     +4.065%
x86_64             2 940 050 134       -----     +2.635%
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 487 829 593       -----     +1.941%
alpha              1 680 733 743       -----     +2.836%
arm               11 563 200 920       -----     +2.848%
hppa               7 272 822 438       -----     +3.263%
m68k               1 998 825 618       -----     +3.199%
mips               1 656 594 101       -----     +1.959%
mipsel             1 659 447 209       -----     +1.946%
mips64             1 955 555 133       -----     +2.448%
mips64el           1 943 601 850       -----     +2.462%
ppc                2 320 357 795       -----     +2.332%
ppc64              2 552 646 688       -----     +2.742%
ppc64le            2 547 404 170       -----      +2.75%
riscv64            1 520 876 206       -----      +3.16%
s390x              5 497 985 417       -----     +1.078%
sh4                2 323 241 912       -----     +3.411%
sparc64            3 427 106 778       -----      +4.73%
x86_64             1 729 384 815       -----     +2.807%
--------------------------------------------------------


</pre></body></html>

--===============5467248030620143453==--

