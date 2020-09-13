Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E3526819D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 00:08:35 +0200 (CEST)
Received: from localhost ([::1]:36528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHaAj-0005FA-Vv
	for lists+qemu-devel@lfdr.de; Sun, 13 Sep 2020 18:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kHaA2-0004o1-Ln
 for qemu-devel@nongnu.org; Sun, 13 Sep 2020 18:07:50 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kHaA0-0000Qy-SR
 for qemu-devel@nongnu.org; Sun, 13 Sep 2020 18:07:50 -0400
Received: by mail-wm1-x335.google.com with SMTP id z9so9396610wmk.1
 for <qemu-devel@nongnu.org>; Sun, 13 Sep 2020 15:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=4kmcltLIftGqMWD6MdDyvCgujcCcaAU6s6NYWncT+ow=;
 b=H7Bay463LNS4e14WUhGzVs0q6ouoG/dr0c32LYePJVCw8A6Ijm3Dq801h0Y+AfIfFU
 6mLOtGQ8RKjw9CeLcF5KXaGgiIPy9+IPxwfaBj37nvmL7NYZ5NawAAN5CS8/7LgmX4yF
 x0JDa6QiEHSKfpycDkgzoUtgYRzPGF1szL/N5t8DlpYFLj+NwwlaePj/1FR7K02ON4FS
 DVcmCEwEcx1Ev1aaIdl9IPqAwLE47CVsICidynFnsiOKcCd8k5sjfWjJkgXSD5UxrVj9
 tT5w+kVzz2FEsb9TD5H0Wea6aRQmYus7Vn/dbJgqYvwyGMzzeU7kmdMliQc91eCqTbci
 ii9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=4kmcltLIftGqMWD6MdDyvCgujcCcaAU6s6NYWncT+ow=;
 b=gnqcG5aA0InYdc8vxyfYXKw32f3L3f9yG1XTJ1UtBwHV8cWevBtwNfSh0V/r5/bp2j
 iD+4bLeyaPSAgrrliMS4k5rAzstbNwfBClSprFEVPe5kMrxMv3Djq0ZChc+fxBKNBRul
 CfxjTu1wzUVvP2TxEH7KxNt1rSobr/CDpBmVV75Gp1UgCgVKRCAnx0kVqiylRfDHDy9a
 Lt3Zi9QRFp5S8gec0USTPosTu6tYPsjd5BwOIpt/VjTkOhJS/PCb+Q0vDkVj+NHzbi09
 nwl0GDIYVp1aHfVt/bxvjpCQAK2LFn/sC20CIm+2vCEndud7IFe+UDIbq/j9PQpmvCm2
 AL2w==
X-Gm-Message-State: AOAM5310/O32UejglN4HJBp6mkii+6IWT3k80lOOnHS3GkT0ahnCY+o4
 0gQbwZ3cPQ7WOYQDJcdWDjFRZD3XnneBFg==
X-Google-Smtp-Source: ABdhPJx+aZ84Yy0xrVnYQXXME8T6S8iLQxyOE2cl+esgInbPB/NTBB033gI7wE3uwCjL/SagIervrg==
X-Received: by 2002:a7b:c958:: with SMTP id i24mr12665977wml.50.1600034866485; 
 Sun, 13 Sep 2020 15:07:46 -0700 (PDT)
Received: from [127.0.1.1] ([197.58.56.75])
 by smtp.gmail.com with ESMTPSA id 97sm17692906wrm.15.2020.09.13.15.07.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 15:07:45 -0700 (PDT)
Message-ID: <5f5e9831.1c69fb81.bdbec.98b8@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============2267697766302901164=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 14 Sep 2020 00:07:44 +0200
Subject: [REPORT] Nightly Performance Tests - Sunday, September 13, 2020
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-wm1-x335.google.com
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

--===============2267697766302901164==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-09-13 21:35:01
End Time (UTC)   : 2020-09-13 22:07:44
Execution Time   : 0:32:42.230467

Status           : SUCCESS

Note:
Changes denoted by '-----' are less than 0.01%.

--------------------------------------------------------
            SUMMARY REPORT - COMMIT f00f57f3
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 158 508 828       -----     +1.702%
alpha              1 914 935 737       -----     +3.522%
arm                8 076 530 212       -----     +2.308%
hppa               4 261 683 277       -----     +3.164%
m68k               2 690 292 498       -----     +7.134%
mips               1 861 900 192       -----     +2.484%
mipsel             2 008 230 252       -----     +2.675%
mips64             1 918 619 554       -----     +2.817%
mips64el           2 051 563 493       -----     +3.026%
ppc                2 480 182 998       -----      +3.11%
ppc64              2 576 703 950       -----     +3.142%
ppc64le            2 558 815 580       -----      +3.17%
riscv64            1 406 695 380       -----     +2.649%
s390x              3 158 135 553       -----     +3.119%
sh4                2 364 595 912       -----      +3.34%
sparc64            3 318 698 159       -----     +3.855%
x86_64             1 775 941 994       -----     +2.167%
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 062 743 600       -----     +1.429%
alpha              3 191 833 331       -----     +3.695%
arm               16 357 294 690       -----     +2.348%
hppa               7 228 398 333       -----     +3.086%
m68k               4 294 058 807       -----     +9.693%
mips               3 051 314 390       -----     +2.423%
mipsel             3 231 539 489       -----      +2.87%
mips64             3 245 810 333       -----     +2.595%
mips64el           3 414 224 392       -----     +3.021%
ppc                4 914 566 476       -----     +4.741%
ppc64              5 098 142 490       -----     +4.565%
ppc64le            5 082 379 941       -----     +4.579%
riscv64            2 192 281 397       -----     +1.955%
s390x              4 584 584 444       -----     +2.898%
sh4                3 949 187 813       -----     +3.468%
sparc64            4 586 103 196       -----     +4.235%
x86_64             2 484 245 365       -----     +1.757%
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 210 358 194       -----     +1.501%
alpha              1 494 102 190       -----     +2.148%
arm                8 263 047 212       -----     +2.667%
hppa               5 207 316 610       -----     +3.047%
m68k               1 725 879 565       -----     +2.528%
mips               1 495 107 231       -----     +1.484%
mipsel             1 497 159 278       -----      +1.48%
mips64             1 715 414 609       -----     +1.893%
mips64el           1 695 217 507       -----     +1.909%
ppc                2 014 609 510       -----     +1.822%
ppc64              2 206 261 487       -----     +2.138%
ppc64le            2 197 963 518       -----     +2.144%
riscv64            1 354 889 828       -----     +2.394%
s390x              2 916 092 750       -----     +1.236%
sh4                1 990 683 821       -----     +2.677%
sparc64            2 874 140 449       -----     +3.827%
x86_64             1 554 138 493       -----      +2.13%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 412 412 599       -----     +0.311%
alpha              3 233 957 639       -----     +7.472%
arm                8 545 302 995       -----      +1.09%
hppa               3 483 527 330       -----     +4.466%
m68k               3 919 110 506       -----    +18.433%
mips               2 344 641 840       -----     +4.085%
mipsel             3 329 912 425       -----     +5.177%
mips64             2 359 024 910       -----     +4.075%
mips64el           3 343 650 686       -----     +5.166%
ppc                3 209 505 701       -----     +3.248%
ppc64              3 287 495 266       -----     +3.173%
ppc64le            3 287 135 580       -----     +3.171%
riscv64            1 221 617 903       -----     +0.278%
s390x              2 874 160 417       -----     +5.826%
sh4                3 544 094 841       -----      +6.42%
sparc64            3 426 094 848       -----     +7.138%
x86_64             1 249 076 697       -----     +0.335%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              598 842 032       -----     +0.612%
alpha                372 406 672       -----     +0.669%
arm                  746 704 888       -----     +1.479%
hppa                 674 273 477       -----     +1.183%
m68k                 410 569 554       -----     +0.919%
mips                 499 566 585       -----     +0.504%
mipsel               499 521 429       -----     +0.501%
mips64               481 532 739       -----     +0.595%
mips64el             465 060 085       -----      +0.62%
ppc                  341 383 786       -----     +0.959%
ppc64                393 784 961       -----     +0.963%
ppc64le              393 939 641       -----     +0.955%
riscv64              351 695 602       -----     +0.781%
s390x                494 447 688       -----     +0.603%
sh4                  402 819 715       -----     +0.937%
sparc64              495 858 081       -----     +1.172%
x86_64               403 087 715       -----     +0.873%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 709 839 947       -----     +2.423%
alpha              1 969 432 086       -----     +3.679%
arm                8 323 168 267       -----     +2.589%
hppa               3 188 316 726       -----       +2.9%
m68k               4 953 947 225       -----    +15.153%
mips               2 123 789 120       -----     +3.049%
mipsel             2 124 235 492       -----     +3.049%
mips64             1 999 025 951       -----     +3.404%
mips64el           1 996 433 190       -----     +3.409%
ppc                2 819 299 843       -----     +5.436%
ppc64              2 768 177 037       -----     +5.512%
ppc64le            2 724 766 044       -----     +5.602%
riscv64            1 638 324 190       -----     +4.021%
s390x              2 519 117 806       -----     +3.364%
sh4                2 595 696 102       -----       +3.0%
sparc64            3 988 892 763       -----     +2.744%
x86_64             2 033 624 062       -----     +3.242%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 193 562 729       -----     +2.924%
alpha              1 521 260 708       -----     +4.191%
arm                3 465 582 377       -----      +2.76%
hppa               2 280 032 678       -----     +3.821%
m68k               1 843 183 257       -----     +3.583%
mips               1 557 898 884       -----     +3.854%
mipsel             1 560 646 099       -----      +3.85%
mips64             1 563 396 551       -----     +4.411%
mips64el           1 542 683 466       -----     +4.474%
ppc                1 728 750 525       -----     +3.668%
ppc64              1 842 435 427       -----     +3.555%
ppc64le            1 791 783 998       -----     +3.659%
riscv64            1 348 879 103       -----     +4.655%
s390x              2 184 080 975       -----      +3.32%
sh4                1 946 644 224       -----     +3.632%
sparc64            3 452 120 576       -----     +2.934%
x86_64             1 813 703 430       -----     +3.546%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 592 357 857       -----     +2.473%
alpha              1 855 803 446       -----     +3.486%
arm                7 347 826 959       -----     +2.684%
hppa               4 758 756 123       -----     +3.543%
m68k               2 376 781 155       -----     +3.566%
mips               2 166 448 423       -----     +2.525%
mipsel             2 163 380 803       -----     +2.528%
mips64             2 029 232 519       -----     +3.116%
mips64el           2 011 634 608       -----     +3.145%
ppc                2 492 968 965       -----     +2.674%
ppc64              2 464 690 908       -----     +2.487%
ppc64le            2 445 215 567       -----     +2.504%
riscv64            1 625 032 953       -----     +3.952%
s390x              4 194 615 394       -----     +6.623%
sh4                2 164 273 325       -----     +3.173%
sparc64            4 299 394 908       -----     +4.062%
x86_64             2 940 163 867       -----     +2.639%
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 487 953 671       -----     +1.946%
alpha              1 680 689 827       -----     +2.833%
arm               11 563 314 314       -----     +2.849%
hppa               7 272 844 939       -----     +3.263%
m68k               1 998 809 920       -----     +3.198%
mips               1 656 435 066       -----     +1.949%
mipsel             1 659 447 003       -----     +1.946%
mips64             1 955 518 822       -----     +2.446%
mips64el           1 943 604 014       -----     +2.462%
ppc                2 320 379 181       -----     +2.333%
ppc64              2 552 644 031       -----     +2.742%
ppc64le            2 547 340 357       -----     +2.747%
riscv64            1 520 842 064       -----     +3.157%
s390x              5 497 984 956       -----     +1.078%
sh4                2 323 367 456       -----     +3.416%
sparc64            3 426 980 452       -----     +4.726%
x86_64             1 729 496 324       -----     +2.814%
--------------------------------------------------------


</pre></body></html>

--===============2267697766302901164==--

