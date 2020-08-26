Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5D4253A09
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 00:04:34 +0200 (CEST)
Received: from localhost ([::1]:46918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kB3Wz-0006FT-Np
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 18:04:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kB3W1-0005MT-NG
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 18:03:33 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kB3Vy-0007tR-RQ
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 18:03:33 -0400
Received: by mail-wr1-x432.google.com with SMTP id r15so3385840wrp.13
 for <qemu-devel@nongnu.org>; Wed, 26 Aug 2020 15:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=4RWuizibWOwdEggqkeWGA4ug3kJMWgjOU3fZffwnf2A=;
 b=oJQkeV585ZFS465sfk7a5hSv/R6eJKRllyu+EYfA1rqbjbxt2hhMy9QrOP9F/M38gV
 MIomOuwdKK4LVYb35v0WSGB0fG3ONVeC3r9RM5Jb2OjcpWqoUbGlWeXNZhTK18JtDC5S
 PRnNJyszvpgxTifd9upfQcDHhWJ51bCqeSWVJFt/9pHVBPVjrqaeY+oERDSCeEQ/G+Y6
 uw7uiLECHt8RQ3SmLxeW31lRnY+sCr5f47CO7AgiP4dpkSLnbUoPjlhXCuAMYBwIF9cl
 9kkVruVtpo3vEFp8tMGkuUPEqWpSa3vhMT8vnrbgQK0Ukni9CTfgfmTkd2qSSE/Uz7kv
 Ljug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=4RWuizibWOwdEggqkeWGA4ug3kJMWgjOU3fZffwnf2A=;
 b=byrLkeXS9d6e5NaxGMMKifQiWhU7uup+8vWDWY5fqdkUHBAR19PgCbbIp50ElwnzUf
 Kjiv5ZL3w5KJQo5MCxV49TqUfR7N8QSFwWvH72h3YfUG35Cm/cbTMHr+zZOTQGVm5/12
 sswdUTBx01oY+QISBF3LsXR/Sz0lFRt/689toz/NX+LRE/8RDUhl+jemFUBpQWVNjx0V
 1Rbv2YOYo5kDUi1Bwx1oQqK1yh5C+/gFTRT5xju1EpxXaILnCdBohgll1ID331xZT2i1
 QfaQi32IH5OA0T5hy8zpN1nJXFYtKGhfGTjZyrYWv8f/Cu9vIzU/isxcZZpAXZOrszwu
 E/Vw==
X-Gm-Message-State: AOAM530FRmRaT/DCt9tg7XXznbsSM9cr4aJBXdJdq9UP8zXqFB7QWhdM
 PQmyn7iX5Z/3UfG4GyDWoHylv7Ce+eU=
X-Google-Smtp-Source: ABdhPJzm5JmQiXOZohawrPWI+IFc9G0CBprRoH1oD9U+QaVJ0zjtxufRkaq2T5TpQh+oa4httdPJyQ==
X-Received: by 2002:a5d:4bcf:: with SMTP id l15mr17092825wrt.384.1598479407927; 
 Wed, 26 Aug 2020 15:03:27 -0700 (PDT)
Received: from [127.0.1.1] ([197.58.67.125])
 by smtp.gmail.com with ESMTPSA id m6sm936993wrw.20.2020.08.26.15.03.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 15:03:27 -0700 (PDT)
Message-ID: <5f46dc2f.1c69fb81.9b2b2.1bc4@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============7865205300651177174=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 27 Aug 2020 00:03:25 +0200
Subject: [REPORT] Nightly Performance Tests - Wednesday, August 26, 2020
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-wr1-x432.google.com
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

--===============7865205300651177174==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-08-26 21:30:02
End Time (UTC)   : 2020-08-26 22:03:25
Execution Time   : 0:33:22.684015

Status           : SUCCESS

Note:
Changes denoted by '-----' are less than 0.01%.

--------------------------------------------------------
            SUMMARY REPORT - COMMIT 25f6dc28
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 158 343 131       -----     +1.692%
alpha              1 914 977 713       -----     +3.525%
arm                8 076 400 021       -----     +2.304%
hppa               4 261 678 154       -----     +3.163%
m68k               2 690 261 170       -----     +7.131%
mips               1 862 023 351       -----     +2.493%
mipsel             2 008 208 091       -----     +2.674%
mips64             1 918 635 853       -----     +2.818%
mips64el           2 051 571 520       -----     +3.026%
ppc                2 480 152 604       -----     +3.107%
ppc64              2 576 708 898       -----     +3.142%
ppc64le            2 558 863 471       -----     +3.173%
riscv64            1 406 706 018       -----      +2.65%
s390x              3 158 137 523       -----     +3.118%
sh4                2 364 463 007       -----     +3.331%
sparc64            3 318 544 246       -----     +3.851%
x86_64             1 775 842 110       -----     +2.156%
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 062 571 701       -----     +1.423%
alpha              3 191 875 352       -----     +3.696%
arm               16 357 154 152       -----     +2.347%
hppa               7 228 368 174       -----     +3.086%
m68k               4 294 003 802       -----     +9.692%
mips               3 051 405 821       -----     +2.426%
mipsel             3 231 506 827       -----     +2.869%
mips64             3 245 837 618       -----     +2.596%
mips64el           3 414 203 643       -----     +3.021%
ppc                4 914 532 207       -----      +4.74%
ppc64              5 098 149 119       -----     +4.565%
ppc64le            5 082 428 275       -----      +4.58%
riscv64            2 192 299 304       -----     +1.956%
s390x              4 584 501 630       -----     +2.896%
sh4                3 949 051 181       -----     +3.464%
sparc64            4 586 202 420       -----     +4.237%
x86_64             2 484 087 711       -----      +1.75%
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 210 184 587       -----     +1.493%
alpha              1 494 141 516       -----     +2.151%
arm                8 262 932 780       -----     +2.665%
hppa               5 207 310 153       -----     +3.047%
m68k               1 725 847 586       -----     +2.526%
mips               1 495 219 183       -----     +1.491%
mipsel             1 497 145 499       -----     +1.479%
mips64             1 715 391 181       -----     +1.892%
mips64el           1 695 282 408       -----     +1.913%
ppc                2 014 571 983       -----      +1.82%
ppc64              2 206 263 388       -----     +2.138%
ppc64le            2 198 011 065       -----     +2.147%
riscv64            1 354 917 093       -----     +2.396%
s390x              2 916 244 976       -----     +1.241%
sh4                1 990 543 099       -----      +2.67%
sparc64            2 872 232 296       -----     +3.758%
x86_64             1 553 980 145       -----      +2.12%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 412 257 972       -----     +0.301%
alpha              3 234 002 286       -----     +7.474%
arm                8 545 170 759       -----     +1.088%
hppa               3 483 589 580       -----     +4.468%
m68k               3 919 052 824       -----    +18.431%
mips               2 344 763 681       -----      +4.09%
mipsel             3 329 886 020       -----     +5.177%
mips64             2 359 046 809       -----     +4.076%
mips64el           3 343 670 164       -----     +5.167%
ppc                3 209 468 569       -----     +3.247%
ppc64              3 287 499 582       -----     +3.173%
ppc64le            3 287 198 812       -----     +3.173%
riscv64            1 221 605 254       -----     +0.277%
s390x              2 874 197 601       -----     +5.827%
sh4                3 543 957 706       -----     +6.416%
sparc64            3 426 148 854       -----     +7.139%
x86_64             1 248 915 867       -----     +0.322%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              598 671 659       -----     +0.584%
alpha                372 448 265       -----      +0.68%
arm                  746 582 840       -----     +1.462%
hppa                 674 272 887       -----     +1.182%
m68k                 410 481 094       -----     +0.897%
mips                 499 688 494       -----     +0.529%
mipsel               499 494 709       -----     +0.496%
mips64               481 554 742       -----     +0.599%
mips64el             465 063 198       -----      +0.62%
ppc                  341 343 876       -----     +0.947%
ppc64                393 792 224       -----     +0.965%
ppc64le              393 989 431       -----     +0.968%
riscv64              351 711 420       -----     +0.785%
s390x                494 425 306       -----     +0.599%
sh4                  402 683 964       -----     +0.903%
sparc64              495 954 007       -----     +1.192%
x86_64               402 927 246       -----     +0.833%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 709 673 773       -----     +2.417%
alpha              1 969 473 620       -----     +3.681%
arm                8 322 994 751       -----     +2.587%
hppa               3 188 293 737       -----     +2.899%
m68k               4 953 917 576       -----    +15.152%
mips               2 123 908 834       -----     +3.055%
mipsel             2 124 211 915       -----     +3.048%
mips64             1 999 047 792       -----     +3.405%
mips64el           1 996 432 087       -----     +3.409%
ppc                2 819 279 504       -----     +5.435%
ppc64              2 768 178 496       -----     +5.512%
ppc64le            2 724 813 640       -----     +5.604%
riscv64            1 638 330 737       -----     +4.021%
s390x              2 519 079 349       -----     +3.362%
sh4                2 595 556 423       -----     +2.995%
sparc64            3 988 985 739       -----     +2.747%
x86_64             2 033 464 430       -----     +3.234%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 193 377 386       -----     +2.915%
alpha              1 521 300 168       -----     +4.193%
arm                3 465 441 831       -----     +2.755%
hppa               2 280 026 181       -----     +3.821%
m68k               1 843 179 638       -----     +3.583%
mips               1 558 014 271       -----     +3.862%
mipsel             1 560 580 983       -----     +3.846%
mips64             1 563 415 733       -----     +4.412%
mips64el           1 542 682 824       -----     +4.474%
ppc                1 728 710 860       -----     +3.665%
ppc64              1 842 439 711       -----     +3.555%
ppc64le            1 791 828 841       -----     +3.661%
riscv64            1 348 867 521       -----     +4.654%
s390x              2 184 071 007       -----     +3.319%
sh4                1 946 505 956       -----     +3.625%
sparc64            3 452 214 449       -----     +2.937%
x86_64             1 813 543 073       -----     +3.537%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 592 205 850       -----     +2.467%
alpha              1 855 846 061       -----     +3.488%
arm                7 347 717 942       -----     +2.682%
hppa               4 758 748 346       -----     +3.542%
m68k               2 376 801 928       -----     +3.567%
mips               2 166 600 038       -----     +2.532%
mipsel             2 163 386 376       -----     +2.528%
mips64             2 029 251 960       -----     +3.117%
mips64el           2 011 634 071       -----     +3.145%
ppc                2 492 954 433       -----     +2.673%
ppc64              2 464 697 778       -----     +2.487%
ppc64le            2 445 263 006       -----     +2.506%
riscv64            1 625 052 509       -----     +3.953%
s390x              4 194 604 069       -----     +6.623%
sh4                2 164 156 067       -----     +3.167%
sparc64            4 299 515 484       -----     +4.065%
x86_64             2 940 458 118       -----     +2.649%
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 487 802 122       -----     +1.939%
alpha              1 680 734 440       -----     +2.836%
arm               11 563 205 116       -----     +2.848%
hppa               7 272 816 177       -----     +3.263%
m68k               1 998 804 916       -----     +3.198%
mips               1 656 586 486       -----     +1.959%
mipsel             1 659 452 403       -----     +1.947%
mips64             1 955 540 992       -----     +2.447%
mips64el           1 943 603 772       -----     +2.462%
ppc                2 320 359 406       -----     +2.333%
ppc64              2 552 650 890       -----     +2.742%
ppc64le            2 547 374 699       -----     +2.748%
riscv64            1 520 864 307       -----     +3.159%
s390x              5 497 976 249       -----     +1.078%
sh4                2 323 249 665       -----     +3.411%
sparc64            3 427 100 722       -----      +4.73%
x86_64             1 729 360 297       -----     +2.806%
--------------------------------------------------------


</pre></body></html>

--===============7865205300651177174==--

