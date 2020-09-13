Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9700267CF8
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Sep 2020 02:11:45 +0200 (CEST)
Received: from localhost ([::1]:34444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHFcO-0006Cl-L3
	for lists+qemu-devel@lfdr.de; Sat, 12 Sep 2020 20:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kHFbi-0005mE-Ah
 for qemu-devel@nongnu.org; Sat, 12 Sep 2020 20:11:02 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kHFbg-0005bT-IR
 for qemu-devel@nongnu.org; Sat, 12 Sep 2020 20:11:02 -0400
Received: by mail-wm1-x332.google.com with SMTP id k18so7910271wmj.5
 for <qemu-devel@nongnu.org>; Sat, 12 Sep 2020 17:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=WscPgeyOeYJImJKN5mXBkdYI86UtQUPQqTaRu8QuM5Q=;
 b=aWbtqznu/NuMuS1zW0rfzQfYpwUpP9KJDWtuTQk0wIM7wc2tS3tTvjaOqBCMQHSDPT
 DnhGt0iilHtwYwEAgoCShFoEplJzVlSQh4vtqLt8Xcbs8JicJFufqedm4W+oXOlqVzCC
 c2jM/2R5zkcTLP4LD/qtJU61pSoHsR6LSf+DA3FaAtTfUBlwpseilRXq1f+ZwYpPMynb
 H98SZpulmMkCjnmXqiQewmxryXDVjQ2XbUBHJv2nIa6fVAHSMqXWSeAFSpz1odFeJl3C
 +EqIdaIXoNB3q5Qs9goZOIxX6LtshfqPH4qoUeLvyhA5bc0r1TwmYRhR35Huprc06ltc
 cxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=WscPgeyOeYJImJKN5mXBkdYI86UtQUPQqTaRu8QuM5Q=;
 b=pW/hcgCIoIkw0i0IWpCkQv2DTiCNqk3uNpfCKZwxuKW4fS8WPFckIMj9vZILf7LvEa
 Q6REKD/Heg54cf+qv6XEya5W5CMR2d3J+BjqSi0mJLiQf9VC6/zoGNwKWPkSaSVQwYXx
 sH8gd84C+mAm1nXqI9RMEbsIVVHku/Jd0Ln5RkR9EbRFdd7HXJUDrFE+jXwcRVecAagt
 m1+/n94gQdNeM5ti62yQJtzA3KP0UW6yLYZAx7pHI5iHQv7+lBLWGqk3g3KnIlVZTmUV
 IdBh80yE0y2WhCefuiLIaBtDPfZZItFgLaM7W5gJjxhbIZbSlT9JdaoUauMVWL7Fe6/J
 wiBw==
X-Gm-Message-State: AOAM531LvG5NZd4v9YIVgeM6Upk2v97PPNiiKqCfAfx1aadHzNJoSj/x
 xttfQJ4NgBD7EmO1edhzs9CfmDCHrdU=
X-Google-Smtp-Source: ABdhPJxCORRDLND1dMci8M3tkaHyYtm7xnFgCyF+texc3Z40X7m3S/RA6SuGiPj8F0eODuwWF/QP8g==
X-Received: by 2002:a1c:6484:: with SMTP id y126mr8601524wmb.177.1599955857702; 
 Sat, 12 Sep 2020 17:10:57 -0700 (PDT)
Received: from [127.0.1.1] ([102.42.234.92])
 by smtp.gmail.com with ESMTPSA id s12sm5536613wmd.20.2020.09.12.17.10.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 17:10:57 -0700 (PDT)
Message-ID: <5f5d6391.1c69fb81.8b028.d75c@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============0400626997272607510=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 13 Sep 2020 02:10:47 +0200
Subject: [REPORT] Nightly Performance Tests - Saturday, September 12, 2020
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

--===============0400626997272607510==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-09-12 23:30:02
End Time (UTC)   : 2020-09-13 00:10:47
Execution Time   : 0:40:45.297747

Status           : SUCCESS

Note:
Changes denoted by '-----' are less than 0.01%.

--------------------------------------------------------
            SUMMARY REPORT - COMMIT c47edb8d
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 158 533 305       -----     +1.704%
alpha              1 914 937 425       -----     +3.522%
arm                8 076 539 818       -----     +2.308%
hppa               4 261 680 617       -----     +3.163%
m68k               2 690 300 478       -----     +7.134%
mips               1 861 900 008       -----     +2.484%
mipsel             2 008 241 691       -----     +2.676%
mips64             1 918 606 346       -----     +2.816%
mips64el           2 051 547 798       -----     +3.025%
ppc                2 480 190 796       -----      +3.11%
ppc64              2 576 721 225       -----     +3.143%
ppc64le            2 558 836 762       -----     +3.172%
riscv64            1 406 697 771       -----     +2.649%
s390x              3 158 142 233       -----     +3.119%
sh4                2 364 602 125       -----     +3.341%
sparc64            3 318 709 670       -----     +3.855%
x86_64             1 775 943 554       -----     +2.167%
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 062 765 352       -----      +1.43%
alpha              3 191 834 824       -----     +3.695%
arm               16 357 303 898       -----     +2.348%
hppa               7 228 395 763       -----     +3.086%
m68k               4 294 066 146       -----     +9.693%
mips               3 051 312 576       -----     +2.423%
mipsel             3 231 549 566       -----      +2.87%
mips64             3 245 796 511       -----     +2.595%
mips64el           3 414 208 805       -----     +3.021%
ppc                4 914 573 969       -----     +4.741%
ppc64              5 098 162 490       -----     +4.565%
ppc64le            5 082 404 015       -----      +4.58%
riscv64            2 192 282 536       -----     +1.955%
s390x              4 584 590 861       -----     +2.898%
sh4                3 949 193 845       -----     +3.468%
sparc64            4 586 114 994       -----     +4.235%
x86_64             2 484 250 046       -----     +1.757%
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 210 379 662       -----     +1.502%
alpha              1 494 102 952       -----     +2.148%
arm                8 263 056 483       -----     +2.667%
hppa               5 207 314 014       -----     +3.047%
m68k               1 725 886 877       -----     +2.528%
mips               1 495 105 629       -----     +1.484%
mipsel             1 497 169 390       -----     +1.481%
mips64             1 715 399 279       -----     +1.892%
mips64el           1 695 203 817       -----     +1.909%
ppc                2 014 616 952       -----     +1.822%
ppc64              2 206 274 942       -----     +2.139%
ppc64le            2 197 983 658       -----     +2.145%
riscv64            1 354 893 842       -----     +2.394%
s390x              2 916 099 097       -----     +1.236%
sh4                1 990 686 479       -----     +2.677%
sparc64            2 874 151 831       -----     +3.827%
x86_64             1 554 140 253       -----      +2.13%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 412 439 264       -----     +0.313%
alpha              3 233 958 824       -----     +7.472%
arm                8 545 314 889       -----      +1.09%
hppa               3 483 524 691       -----     +4.466%
m68k               3 919 118 621       -----    +18.433%
mips               2 344 642 485       -----     +4.085%
mipsel             3 329 922 487       -----     +5.178%
mips64             2 359 012 166       -----     +4.074%
mips64el           3 343 634 242       -----     +5.166%
ppc                3 209 513 106       -----     +3.248%
ppc64              3 287 511 276       -----     +3.173%
ppc64le            3 287 155 524       -----     +3.172%
riscv64            1 221 619 550       -----     +0.278%
s390x              2 874 166 663       -----     +5.826%
sh4                3 544 100 534       -----      +6.42%
sparc64            3 426 106 067       -----     +7.138%
x86_64             1 249 075 945       -----     +0.335%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              598 865 861       -----     +0.616%
alpha                372 410 032       -----     +0.669%
arm                  746 714 166       -----      +1.48%
hppa                 674 267 687       -----     +1.182%
m68k                 410 576 934       -----      +0.92%
mips                 499 573 783       -----     +0.506%
mipsel               499 534 084       -----     +0.504%
mips64               481 519 914       -----     +0.592%
mips64el             465 046 655       -----     +0.617%
ppc                  341 391 214       -----     +0.961%
ppc64                393 803 964       -----     +0.968%
ppc64le              393 962 079       -----     +0.961%
riscv64              351 697 146       -----     +0.781%
s390x                494 453 894       -----     +0.604%
sh4                  402 827 445       -----     +0.939%
sparc64              495 872 108       -----     +1.175%
x86_64               403 089 594       -----     +0.873%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 709 864 415       -----     +2.424%
alpha              1 969 433 070       -----     +3.679%
arm                8 323 177 519       -----     +2.589%
hppa               3 188 314 283       -----       +2.9%
m68k               4 953 954 205       -----    +15.153%
mips               2 123 787 479       -----     +3.049%
mipsel             2 124 248 355       -----     +3.049%
mips64             1 999 013 204       -----     +3.403%
mips64el           1 996 416 194       -----     +3.408%
ppc                2 819 307 354       -----     +5.436%
ppc64              2 768 193 208       -----     +5.513%
ppc64le            2 724 786 397       -----     +5.603%
riscv64            1 638 325 642       -----     +4.021%
s390x              2 519 124 417       -----     +3.364%
sh4                2 595 701 950       -----       +3.0%
sparc64            3 988 904 373       -----     +2.745%
x86_64             2 033 623 526       -----     +3.242%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 193 586 965       -----     +2.925%
alpha              1 521 261 723       -----     +4.191%
arm                3 465 591 803       -----      +2.76%
hppa               2 280 032 641       -----     +3.821%
m68k               1 843 192 908       -----     +3.583%
mips               1 557 897 310       -----     +3.854%
mipsel             1 560 658 932       -----     +3.851%
mips64             1 563 383 795       -----      +4.41%
mips64el           1 542 666 910       -----     +4.473%
ppc                1 728 757 953       -----     +3.668%
ppc64              1 842 451 475       -----     +3.556%
ppc64le            1 791 803 879       -----      +3.66%
riscv64            1 348 883 075       -----     +4.655%
s390x              2 184 089 880       -----      +3.32%
sh4                1 946 650 279       -----     +3.632%
sparc64            3 452 132 027       -----     +2.935%
x86_64             1 813 702 618       -----     +3.546%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 592 384 641       -----     +2.474%
alpha              1 855 804 601       -----     +3.486%
arm                7 347 836 261       -----     +2.684%
hppa               4 758 753 483       -----     +3.542%
m68k               2 376 788 503       -----     +3.566%
mips               2 166 447 419       -----     +2.525%
mipsel             2 163 393 689       -----     +2.528%
mips64             2 029 219 831       -----     +3.116%
mips64el           2 011 618 101       -----     +3.144%
ppc                2 492 979 113       -----     +2.674%
ppc64              2 464 709 759       -----     +2.488%
ppc64le            2 445 235 570       -----     +2.505%
riscv64            1 625 036 943       -----     +3.952%
s390x              4 194 621 780       -----     +6.623%
sh4                2 164 281 281       -----     +3.173%
sparc64            4 299 406 437       -----     +4.062%
x86_64             2 940 165 681       -----     +2.639%
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 487 980 285       -----     +1.947%
alpha              1 680 693 379       -----     +2.834%
arm               11 563 323 525       -----     +2.849%
hppa               7 272 842 376       -----     +3.263%
m68k               1 998 819 637       -----     +3.198%
mips               1 656 433 386       -----     +1.949%
mipsel             1 659 457 025       -----     +1.947%
mips64             1 955 506 071       -----     +2.446%
mips64el           1 943 587 660       -----     +2.462%
ppc                2 320 386 707       -----     +2.334%
ppc64              2 552 662 692       -----     +2.742%
ppc64le            2 547 362 981       -----     +2.748%
riscv64            1 520 843 439       -----     +3.157%
s390x              5 497 991 278       -----     +1.078%
sh4                2 323 375 192       -----     +3.417%
sparc64            3 426 989 530       -----     +4.726%
x86_64             1 729 500 772       -----     +2.814%
--------------------------------------------------------


</pre></body></html>

--===============0400626997272607510==--

