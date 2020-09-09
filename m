Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C36F6263958
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 01:04:10 +0200 (CEST)
Received: from localhost ([::1]:56052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kG98L-0008Nd-AN
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 19:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kG97T-0007xt-AV
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 19:03:15 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kG97R-0007Tu-9n
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 19:03:14 -0400
Received: by mail-wr1-x42a.google.com with SMTP id z1so4653557wrt.3
 for <qemu-devel@nongnu.org>; Wed, 09 Sep 2020 16:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=DvitxngdIRNKYk8LD/fUGowZMz1Hlqvmi9feQXyjmAQ=;
 b=QK3+1plwwj1dc+ql82AXQ/LnCkgv7CLU7VPPadDxtN+EnJYRztF9p2MvEp93+Xuvo3
 WMm60//2rUpg5gainGkIi55gD8dQLyG868UBCnv3d0JIHQ1+NgpTDp+s/P+81pu5iMSb
 CXoJnzOCjSx3jf3WpGMbsnebozq/4PSGxgIsyw48K85/70kf22K/w6YwT+yvBCSPv9Fo
 b7Pp0zkcUJIyGqrrJpFOvcLk9kvPzwWoPWw2ubFXXRXNDK9E1wFsVA1AOS9vgPWuKm5W
 Jix9ubyNuD133JfEEb2DILMEQuc0qM6E+IA6gC+SH0tHWdGHX2N39lA4OYCthaFHGWVV
 uJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=DvitxngdIRNKYk8LD/fUGowZMz1Hlqvmi9feQXyjmAQ=;
 b=fHLq7sRmjLpdSxpQjLYQdkKcb19eqKX0WfyDTMTTi0+ug+looELvwDzXmVyGO27ITh
 magytss4Gn3GOY9B5hdMYhTcN11GSUO0nS6+I13vlTgyiJz6N01X5jF30kmrE10iiG6q
 9/EG6v6rxJH2hMGop9qY6/FnmHI2YUXQchwEv1JjvKp3q3EJsnMqxcr3BWZ0/l0TCstf
 D+mM8MJOux/XBbwlX8MUB444k+7ywJ/lGLYF4G4LyH9wXNkDcQPM8sLXVkucQB75eRPb
 hiXv4Fu90cLfXeC8Z/W5ldO7C52prYHZJuLVQeybVk0C2gTC0VXwwfeJS/1fe6H1uHq8
 y//w==
X-Gm-Message-State: AOAM531T01WVT6vrzmOgc1mFBzfDHEiokOkU5VMO4YopHP0UP2bMmDxZ
 VRUBqb+RIdPZZgc+Pk8UBcKMKsTRfo0=
X-Google-Smtp-Source: ABdhPJwU7qN4hBytEGCoSWehsITGlj3fzs/ILNYMoghBD29lY5X4rvGfR6xOTpaQP6mIpN4eWrlIzA==
X-Received: by 2002:adf:e4c9:: with SMTP id v9mr5776081wrm.375.1599692590787; 
 Wed, 09 Sep 2020 16:03:10 -0700 (PDT)
Received: from [127.0.1.1] ([197.58.131.233])
 by smtp.gmail.com with ESMTPSA id r15sm772037wmn.24.2020.09.09.16.03.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 16:03:10 -0700 (PDT)
Message-ID: <5f595f2e.1c69fb81.bb42.2780@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============1842373179918117782=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 10 Sep 2020 01:03:07 +0200
Subject: [REPORT] Nightly Performance Tests - Wednesday, September 9, 2020
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-wr1-x42a.google.com
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

--===============1842373179918117782==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-09-09 22:30:01
End Time (UTC)   : 2020-09-09 23:03:07
Execution Time   : 0:33:05.538923

Status           : SUCCESS

Note:
Changes denoted by '-----' are less than 0.01%.

--------------------------------------------------------
            SUMMARY REPORT - COMMIT 9435a8b3
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 158 522 544       -----     +1.703%
alpha              1 914 935 308       -----     +3.521%
arm                8 076 520 812       -----     +2.308%
hppa               4 261 684 900       -----     +3.164%
m68k               2 690 295 007       -----     +7.134%
mips               1 861 890 014       -----     +2.483%
mipsel             2 008 235 946       -----     +2.676%
mips64             1 918 617 216       -----     +2.817%
mips64el           2 051 541 704       -----     +3.024%
ppc                2 480 189 411       -----      +3.11%
ppc64              2 576 718 770       -----     +3.143%
ppc64le            2 558 841 069       -----     +3.172%
riscv64            1 406 690 655       -----     +2.649%
s390x              3 158 135 000       -----     +3.118%
sh4                2 364 613 426       -----     +3.342%
sparc64            3 318 708 055       -----     +3.855%
x86_64             1 775 950 449       -----     +2.167%
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 062 756 695       -----      +1.43%
alpha              3 191 832 287       -----     +3.695%
arm               16 357 285 139       -----     +2.348%
hppa               7 228 399 652       -----     +3.086%
m68k               4 294 060 261       -----     +9.693%
mips               3 051 309 526       -----     +2.423%
mipsel             3 231 548 527       -----      +2.87%
mips64             3 245 807 529       -----     +2.595%
mips64el           3 414 201 984       -----     +3.021%
ppc                4 914 573 285       -----     +4.741%
ppc64              5 098 156 715       -----     +4.565%
ppc64le            5 082 408 601       -----      +4.58%
riscv64            2 192 274 279       -----     +1.954%
s390x              4 584 583 501       -----     +2.897%
sh4                3 949 205 390       -----     +3.468%
sparc64            4 586 112 971       -----     +4.235%
x86_64             2 484 255 485       -----     +1.757%
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 210 370 437       -----     +1.502%
alpha              1 494 100 836       -----     +2.148%
arm                8 263 037 447       -----     +2.666%
hppa               5 207 317 925       -----     +3.047%
m68k               1 725 881 154       -----     +2.528%
mips               1 495 096 306       -----     +1.483%
mipsel             1 497 162 134       -----      +1.48%
mips64             1 715 411 865       -----     +1.893%
mips64el           1 695 198 169       -----     +1.908%
ppc                2 014 615 604       -----     +1.822%
ppc64              2 206 275 558       -----     +2.139%
ppc64le            2 197 987 787       -----     +2.146%
riscv64            1 354 886 276       -----     +2.394%
s390x              2 916 091 833       -----     +1.236%
sh4                1 990 699 952       -----     +2.678%
sparc64            2 874 149 950       -----     +3.827%
x86_64             1 554 147 703       -----     +2.131%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 412 427 497       -----     +0.313%
alpha              3 233 958 809       -----     +7.472%
arm                8 545 295 858       -----      +1.09%
hppa               3 483 528 550       -----     +4.466%
m68k               3 919 112 040       -----    +18.433%
mips               2 344 633 252       -----     +4.084%
mipsel             3 329 915 307       -----     +5.178%
mips64             2 359 022 136       -----     +4.075%
mips64el           3 343 628 654       -----     +5.166%
ppc                3 209 511 959       -----     +3.248%
ppc64              3 287 509 310       -----     +3.173%
ppc64le            3 287 159 635       -----     +3.172%
riscv64            1 221 611 676       -----     +0.278%
s390x              2 874 159 473       -----     +5.826%
sh4                3 544 111 698       -----     +6.421%
sparc64            3 426 104 216       -----     +7.138%
x86_64             1 249 083 454       -----     +0.335%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              598 854 017       -----     +0.614%
alpha                372 407 923       -----     +0.669%
arm                  746 695 100       -----     +1.478%
hppa                 674 274 223       -----     +1.183%
m68k                 410 573 691       -----      +0.92%
mips                 499 555 706       -----     +0.502%
mipsel               499 533 047       -----     +0.504%
mips64               481 536 093       -----     +0.595%
mips64el             465 041 028       -----     +0.615%
ppc                  341 386 882       -----      +0.96%
ppc64                393 801 668       -----     +0.967%
ppc64le              393 965 982       -----     +0.962%
riscv64              351 692 490       -----      +0.78%
s390x                494 446 785       -----     +0.603%
sh4                  402 838 220       -----     +0.942%
sparc64              495 870 051       -----     +1.175%
x86_64               403 096 618       -----     +0.875%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 709 855 273       -----     +2.424%
alpha              1 969 430 125       -----     +3.679%
arm                8 323 158 501       -----     +2.589%
hppa               3 188 318 055       -----       +2.9%
m68k               4 953 948 679       -----    +15.153%
mips               2 123 778 182       -----     +3.049%
mipsel             2 124 240 892       -----     +3.049%
mips64             1 999 023 230       -----     +3.404%
mips64el           1 996 410 652       -----     +3.408%
ppc                2 819 307 169       -----     +5.436%
ppc64              2 768 191 230       -----     +5.513%
ppc64le            2 724 790 952       -----     +5.603%
riscv64            1 638 317 619       -----      +4.02%
s390x              2 519 116 878       -----     +3.364%
sh4                2 595 713 430       -----     +3.001%
sparc64            3 988 902 901       -----     +2.745%
x86_64             2 033 631 840       -----     +3.243%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 193 575 166       -----     +2.924%
alpha              1 521 259 330       -----     +4.191%
arm                3 465 572 585       -----     +2.759%
hppa               2 280 036 567       -----     +3.821%
m68k               1 843 187 434       -----     +3.583%
mips               1 557 885 451       -----     +3.853%
mipsel             1 560 651 549       -----      +3.85%
mips64             1 563 393 796       -----     +4.411%
mips64el           1 542 661 246       -----     +4.473%
ppc                1 728 757 239       -----     +3.668%
ppc64              1 842 447 119       -----     +3.555%
ppc64le            1 791 808 544       -----      +3.66%
riscv64            1 348 875 293       -----     +4.654%
s390x              2 184 082 649       -----      +3.32%
sh4                1 946 660 563       -----     +3.633%
sparc64            3 452 130 162       -----     +2.934%
x86_64             1 813 710 491       -----     +3.546%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 592 372 783       -----     +2.474%
alpha              1 855 802 092       -----     +3.485%
arm                7 347 817 276       -----     +2.684%
hppa               4 758 757 987       -----     +3.543%
m68k               2 376 782 584       -----     +3.566%
mips               2 166 437 579       -----     +2.524%
mipsel             2 163 386 273       -----     +2.528%
mips64             2 029 227 085       -----     +3.116%
mips64el           2 011 612 467       -----     +3.144%
ppc                2 492 977 887       -----     +2.674%
ppc64              2 464 707 676       -----     +2.488%
ppc64le            2 445 239 810       -----     +2.505%
riscv64            1 625 029 169       -----     +3.952%
s390x              4 194 614 476       -----     +6.623%
sh4                2 164 292 282       -----     +3.174%
sparc64            4 299 404 460       -----     +4.062%
x86_64             2 940 171 821       -----     +2.639%
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 487 968 485       -----     +1.946%
alpha              1 680 691 064       -----     +2.833%
arm               11 563 304 595       -----     +2.849%
hppa               7 272 846 245       -----     +3.263%
m68k               1 998 814 219       -----     +3.198%
mips               1 656 424 111       -----     +1.949%
mipsel             1 659 449 845       -----     +1.946%
mips64             1 955 515 996       -----     +2.446%
mips64el           1 943 579 438       -----     +2.461%
ppc                2 320 385 263       -----     +2.334%
ppc64              2 552 660 886       -----     +2.742%
ppc64le            2 547 367 241       -----     +2.748%
riscv64            1 520 838 442       -----     +3.157%
s390x              5 497 984 412       -----     +1.078%
sh4                2 323 385 875       -----     +3.417%
sparc64            3 426 989 736       -----     +4.726%
x86_64             1 729 506 187       -----     +2.814%
--------------------------------------------------------


</pre></body></html>

--===============1842373179918117782==--

