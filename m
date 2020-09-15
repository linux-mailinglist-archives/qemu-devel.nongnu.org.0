Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FDA26AF43
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 23:14:43 +0200 (CEST)
Received: from localhost ([::1]:55920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIIHi-0006J3-2L
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 17:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kIIFw-0005PP-NF
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 17:12:52 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:50180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kIIFu-0000Z6-QO
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 17:12:52 -0400
Received: by mail-wm1-x32c.google.com with SMTP id e17so821368wme.0
 for <qemu-devel@nongnu.org>; Tue, 15 Sep 2020 14:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=P/Flql3AZSH7igCQJYoSaWv71zR8oazPJuXLj5Pyzt4=;
 b=bq+r8VijWl+orHnTTNQ4fg9Cj0XgA6B0A5/lwwFWClvEzaVxeM7AzeeTZ3coVRebis
 3nKYheppW7CxR1LAMHuXTySCXtD/AFMmY4P2KQq0/lS9lFbXeQ2MMOva7aK0kyMtkxZ0
 ovScNVQMLPKrEPa8vU9HZX+a6OKmYmiD348eaF8Jvk48jT7Zby/jfXnt+aKsBxlDmPuu
 9v6TMRRFcYfNYUBNusz4k4jFsiLCVOFLaxRrIANxGghSvbAqk7cpBePbJtc2tEeV2J5k
 4CMcmol9rMUlOJaZtTQn8hwCujp0YpZ20BzdPh/WQd6qRhnIUG/BRrcheBi9n4vufuVZ
 UxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=P/Flql3AZSH7igCQJYoSaWv71zR8oazPJuXLj5Pyzt4=;
 b=WKPuMVaDaiseqdizsulnQYiNJ8/1vep2LEmYgxAtHzu+oW6vyv0+uy+JQ0Rv4kk8qk
 DY3l3PdpbdWCKPD3aDZ5WnYfSS4/eLeOxUemShrI17QOZhC3ThRNlxFj5wXqxhlaO6aq
 m4X7+4F4LdUBIMmF4Yc55SHUqNRNRoxwodmLpyJBpfw7aiaRM6X4qNtI7dQVLUuyLvjI
 BGl149T1F7wdTSKjpGw3TRcFpFhal6IksSrFsf90BJPO8XojjoXBN1QoefhJGCZbcRKg
 9tF00yZdPZKxA7qeHfxHa7DIpPAYufpHAMRDYxmIhkS14Y2e8xj9CphRMO7TaZ9xqCRv
 ORBg==
X-Gm-Message-State: AOAM532r2jyWhgHwkSgBvxJy+rQokmXchCKrcPkjrGzc3hlo3TLXIPIw
 ozQgy4D8Lmmlap2MWPqaHo4ywZ8H2wU=
X-Google-Smtp-Source: ABdhPJzephX7Ljkpcf3meRQSFzVA7apNzfg7121sT/xMqv/Q9qqVDhSLbSDxr+FmdBwol/CwxVn4GQ==
X-Received: by 2002:a05:600c:c5:: with SMTP id u5mr1214616wmm.14.1600204365950; 
 Tue, 15 Sep 2020 14:12:45 -0700 (PDT)
Received: from [127.0.1.1] ([197.58.214.236])
 by smtp.gmail.com with ESMTPSA id q8sm28841828wrx.79.2020.09.15.14.12.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 14:12:45 -0700 (PDT)
Message-ID: <5f612e4d.1c69fb81.ab307.6bc3@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============5199846476027258422=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Sep 2020 23:12:43 +0200
Subject: [REPORT] Nightly Performance Tests - Tuesday, September 15, 2020
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-wm1-x32c.google.com
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

--===============5199846476027258422==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-09-15 20:40:01
End Time (UTC)   : 2020-09-15 21:12:43
Execution Time   : 0:32:41.290408

Status           : SUCCESS

Note:
Changes denoted by '-----' are less than 0.01%.

--------------------------------------------------------
            SUMMARY REPORT - COMMIT de39a045
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 158 524 492       -----     +1.704%
alpha              1 914 934 541       -----     +3.521%
arm                8 076 523 798       -----     +2.308%
hppa               4 261 683 298       -----     +3.163%
m68k               2 690 291 552       -----     +7.134%
mips               1 861 895 402       -----     +2.484%
mipsel             2 008 239 436       -----     +2.676%
mips64             1 918 601 151       -----     +2.816%
mips64el           2 051 554 246       -----     +3.025%
ppc                2 480 178 421       -----      +3.11%
ppc64              2 576 714 241       -----     +3.143%
ppc64le            2 558 832 167       -----     +3.171%
riscv64            1 406 692 488       -----     +2.649%
s390x              3 158 132 301       -----     +3.118%
sh4                2 364 605 623       -----     +3.341%
sparc64            3 318 701 656       -----     +3.855%
x86_64             1 775 944 131       -----     +2.167%
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 062 758 181       -----      +1.43%
alpha              3 191 832 563       -----     +3.695%
arm               16 357 287 709       -----     +2.348%
hppa               7 228 398 607       -----     +3.086%
m68k               4 294 056 637       -----     +9.693%
mips               3 051 310 255       -----     +2.423%
mipsel             3 231 548 335       -----      +2.87%
mips64             3 245 791 692       -----     +2.595%
mips64el           3 414 214 247       -----     +3.021%
ppc                4 914 561 218       -----      +4.74%
ppc64              5 098 152 776       -----     +4.565%
ppc64le            5 082 399 487       -----      +4.58%
riscv64            2 192 276 027       -----     +1.955%
s390x              4 584 581 806       -----     +2.897%
sh4                3 949 197 215       -----     +3.468%
sparc64            4 586 107 304       -----     +4.235%
x86_64             2 484 250 887       -----     +1.757%
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 210 370 607       -----     +1.502%
alpha              1 494 098 562       -----     +2.148%
arm                8 263 040 235       -----     +2.667%
hppa               5 207 316 726       -----     +3.047%
m68k               1 725 877 759       -----     +2.528%
mips               1 495 100 498       -----     +1.483%
mipsel             1 497 165 574       -----      +1.48%
mips64             1 715 397 024       -----     +1.892%
mips64el           1 695 210 741       -----     +1.909%
ppc                2 014 604 657       -----     +1.822%
ppc64              2 206 271 827       -----     +2.139%
ppc64le            2 197 979 437       -----     +2.145%
riscv64            1 354 885 081       -----     +2.394%
s390x              2 916 086 983       -----     +1.236%
sh4                1 990 693 213       -----     +2.678%
sparc64            2 874 141 483       -----     +3.827%
x86_64             1 554 140 016       -----      +2.13%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 412 427 654       -----     +0.313%
alpha              3 233 959 954       -----     +7.472%
arm                8 545 300 488       -----      +1.09%
hppa               3 483 527 384       -----     +4.466%
m68k               3 919 108 398       -----    +18.433%
mips               2 344 640 021       -----     +4.085%
mipsel             3 329 921 331       -----     +5.178%
mips64             2 359 007 385       -----     +4.074%
mips64el           3 343 641 166       -----     +5.166%
ppc                3 209 500 644       -----     +3.248%
ppc64              3 287 505 472       -----     +3.173%
ppc64le            3 287 151 250       -----     +3.172%
riscv64            1 221 613 034       -----     +0.278%
s390x              2 874 157 430       -----     +5.825%
sh4                3 544 104 249       -----      +6.42%
sparc64            3 426 098 297       -----     +7.138%
x86_64             1 249 078 704       -----     +0.335%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              598 856 966       -----     +0.615%
alpha                372 405 631       -----     +0.668%
arm                  746 697 869       -----     +1.478%
hppa                 674 270 309       -----     +1.182%
m68k                 410 570 367       -----     +0.919%
mips                 499 562 372       -----     +0.503%
mipsel               499 532 878       -----     +0.504%
mips64               481 515 065       -----     +0.591%
mips64el             465 053 650       -----     +0.618%
ppc                  341 379 003       -----     +0.957%
ppc64                393 795 349       -----     +0.966%
ppc64le              393 955 377       -----     +0.959%
riscv64              351 691 059       -----      +0.78%
s390x                494 444 401       -----     +0.602%
sh4                  402 831 689       -----      +0.94%
sparc64              495 861 580       -----     +1.173%
x86_64               403 089 114       -----     +0.873%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 709 857 817       -----     +2.424%
alpha              1 969 431 252       -----     +3.679%
arm                8 323 161 374       -----     +2.589%
hppa               3 188 316 891       -----       +2.9%
m68k               4 953 945 181       -----    +15.153%
mips               2 123 785 149       -----     +3.049%
mipsel             2 124 246 932       -----     +3.049%
mips64             1 999 005 756       -----     +3.403%
mips64el           1 996 423 243       -----     +3.408%
ppc                2 819 294 709       -----     +5.436%
ppc64              2 768 184 561       -----     +5.513%
ppc64le            2 724 781 990       -----     +5.603%
riscv64            1 638 330 111       -----     +4.021%
s390x              2 519 115 389       -----     +3.364%
sh4                2 595 705 506       -----     +3.001%
sparc64            3 988 896 772       -----     +2.745%
x86_64             2 033 624 353       -----     +3.242%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 193 577 874       -----     +2.924%
alpha              1 521 259 681       -----     +4.191%
arm                3 465 575 367       -----     +2.759%
hppa               2 280 035 342       -----     +3.821%
m68k               1 843 184 030       -----     +3.583%
mips               1 557 892 324       -----     +3.854%
mipsel             1 560 657 562       -----     +3.851%
mips64             1 563 376 247       -----      +4.41%
mips64el           1 542 673 826       -----     +4.474%
ppc                1 728 745 579       -----     +3.668%
ppc64              1 842 445 781       -----     +3.555%
ppc64le            1 791 799 738       -----      +3.66%
riscv64            1 348 876 827       -----     +4.654%
s390x              2 184 078 070       -----     +3.319%
sh4                1 946 650 971       -----     +3.632%
sparc64            3 452 124 383       -----     +2.934%
x86_64             1 813 705 546       -----     +3.546%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 592 375 536       -----     +2.474%
alpha              1 855 799 825       -----     +3.485%
arm                7 347 820 010       -----     +2.684%
hppa               4 758 756 135       -----     +3.543%
m68k               2 376 779 177       -----     +3.566%
mips               2 166 444 408       -----     +2.524%
mipsel             2 163 389 693       -----     +2.528%
mips64             2 029 214 940       -----     +3.115%
mips64el           2 011 622 502       -----     +3.144%
ppc                2 492 966 760       -----     +2.674%
ppc64              2 464 703 750       -----     +2.488%
ppc64le            2 445 231 337       -----     +2.504%
riscv64            1 625 027 935       -----     +3.952%
s390x              4 194 612 328       -----     +6.623%
sh4                2 164 285 292       -----     +3.173%
sparc64            4 299 398 863       -----     +4.062%
x86_64             2 940 166 181       -----     +2.639%
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 487 971 304       -----     +1.946%
alpha              1 680 688 862       -----     +2.833%
arm               11 563 307 337       -----     +2.849%
hppa               7 272 844 993       -----     +3.263%
m68k               1 998 810 872       -----     +3.198%
mips               1 656 428 191       -----     +1.949%
mipsel             1 659 453 187       -----     +1.947%
mips64             1 955 501 106       -----     +2.445%
mips64el           1 943 594 598       -----     +2.462%
ppc                2 320 374 801       -----     +2.333%
ppc64              2 552 654 412       -----     +2.742%
ppc64le            2 547 358 726       -----     +2.748%
riscv64            1 520 839 832       -----     +3.157%
s390x              5 497 982 007       -----     +1.078%
sh4                2 323 376 855       -----     +3.417%
sparc64            3 426 984 570       -----     +4.726%
x86_64             1 729 498 252       -----     +2.814%
--------------------------------------------------------


</pre></body></html>

--===============5199846476027258422==--

