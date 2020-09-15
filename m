Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B10269A64
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 02:24:41 +0200 (CEST)
Received: from localhost ([::1]:42430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHym0-0004dV-DT
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 20:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kHyl6-0004B7-VU
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 20:23:45 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:33279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kHyl4-0007IE-Uy
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 20:23:44 -0400
Received: by mail-wm1-x329.google.com with SMTP id e11so9918841wme.0
 for <qemu-devel@nongnu.org>; Mon, 14 Sep 2020 17:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=oLYSWvlcyCXvdFRKEq3ITdi0SdWati9O8R2fJOTM5Hc=;
 b=p+6gDAi7wmwMlMPEy/njglX+fvmsgRv6JxZXPbDDBNIUqOx6liGTr8Hq/NGugD8xbw
 T4sxjEXRF3Bw3IkXpHdKhcUWM3UvNzAzgYBbgEv+fsn3TrScRQMul5vsY/RWcu8XOwpE
 ya+KqvGFynEvgmvCBRYrLPInTfoVcgSJecmIpZbJhxr1U9ACbC3Wz+OCJ76JhPH+g8kC
 C6bz57U5muMXEE6BhuQ8Yh5ylBanKvkDIZdMSih2Thzh01rRM4OlmBZ4pdOKrzGwcw/z
 nR4QKr+0vCwXy/SZ2MFv/nnikYeyGyidGnZVQtm/qNRdbJedU8EDZAbC4GuOls1/JkZ9
 WckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=oLYSWvlcyCXvdFRKEq3ITdi0SdWati9O8R2fJOTM5Hc=;
 b=Jpt5wcEwyNtY4cX5z6/UD8VS5AaHwVy+p0QPCLOLX2w2Z/P9A4YL9fbchHNEuC5rBB
 29nh+A+WzvDA+nXcDh84Y60zwC5C5ERlL0gDMGvCQGPniO1qJuUmUDd5TCwUd3l0pfKE
 +tXIOtLOBUY4xOTyCMEzNfdrEgb+ee5y/UuOG9BaDVJpn2xs6DeTa7qCTzhzHaoO+I/m
 sZw2+27toMHVQZpAjeK/h9C9Kr8SdpBzH+GydSUKRiETdftCyA/7hFX10cJwW3mtXzkB
 Zf9N4yPO7ataXZJKEcbgtoIAWyWbZTRQDmGqSuy14jqraE5igmaFkesTwNjJnAmSrbSg
 tGlw==
X-Gm-Message-State: AOAM530d9WJTZaPaGFch3w+SadkhalX4pSE+PUenAgTEAqThM6DZycmw
 jQ3yADbzYiN4NmiFfxaeNlj0jrdbUuz37g==
X-Google-Smtp-Source: ABdhPJyEA771oOuOcOnBhmhEDnS4xT20Rj62HhPlvYNIOtwD3AU7SEGxwv2/WfaX8QTEOwHYZPzh+w==
X-Received: by 2002:a1c:bdc4:: with SMTP id n187mr1756353wmf.109.1600129420323; 
 Mon, 14 Sep 2020 17:23:40 -0700 (PDT)
Received: from [127.0.1.1] ([197.58.56.75])
 by smtp.gmail.com with ESMTPSA id p11sm20771261wma.11.2020.09.14.17.23.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 17:23:39 -0700 (PDT)
Message-ID: <5f60098b.1c69fb81.52345.3777@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============2166789138032477778=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Sep 2020 02:23:36 +0200
Subject: [REPORT] Nightly Performance Tests - Monday, September 14, 2020
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-wm1-x329.google.com
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

--===============2166789138032477778==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-09-14 23:50:01
End Time (UTC)   : 2020-09-15 00:23:36
Execution Time   : 0:33:35.073901

Status           : SUCCESS

Note:
Changes denoted by '-----' are less than 0.01%.

--------------------------------------------------------
            SUMMARY REPORT - COMMIT 2d2c73d0
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 158 526 497       -----     +1.704%
alpha              1 914 934 456       -----     +3.521%
arm                8 076 525 475       -----     +2.308%
hppa               4 261 674 155       -----     +3.163%
m68k               2 690 286 745       -----     +7.134%
mips               1 861 909 990       -----     +2.485%
mipsel             2 008 232 972       -----     +2.675%
mips64             1 918 611 432       -----     +2.817%
mips64el           2 051 558 759       -----     +3.026%
ppc                2 480 190 626       -----     +3.111%
ppc64              2 576 704 411       -----     +3.142%
ppc64le            2 558 826 758       -----     +3.171%
riscv64            1 406 690 056       -----     +2.648%
s390x              3 158 137 991       -----     +3.119%
sh4                2 364 597 394       -----      +3.34%
sparc64            3 318 698 826       -----     +3.855%
x86_64             1 775 946 436       -----     +2.167%
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 062 758 110       -----      +1.43%
alpha              3 191 832 536       -----     +3.695%
arm               16 357 290 166       -----     +2.348%
hppa               7 228 388 968       -----     +3.086%
m68k               4 294 052 082       -----     +9.693%
mips               3 051 324 052       -----     +2.423%
mipsel             3 231 541 123       -----      +2.87%
mips64             3 245 801 241       -----     +2.595%
mips64el           3 414 218 711       -----     +3.021%
ppc                4 914 574 577       -----     +4.741%
ppc64              5 098 142 590       -----     +4.565%
ppc64le            5 082 394 928       -----     +4.579%
riscv64            2 192 274 732       -----     +1.954%
s390x              4 584 586 983       -----     +2.898%
sh4                3 949 189 064       -----     +3.468%
sparc64            4 586 103 855       -----     +4.235%
x86_64             2 484 252 053       -----     +1.757%
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 210 372 521       -----     +1.502%
alpha              1 494 098 613       -----     +2.148%
arm                8 263 042 498       -----     +2.667%
hppa               5 207 307 253       -----     +3.047%
m68k               1 725 873 225       -----     +2.528%
mips               1 495 116 648       -----     +1.484%
mipsel             1 497 160 995       -----      +1.48%
mips64             1 715 408 180       -----     +1.893%
mips64el           1 695 215 333       -----     +1.909%
ppc                2 014 617 377       -----     +1.823%
ppc64              2 206 261 667       -----     +2.138%
ppc64le            2 197 974 982       -----     +2.145%
riscv64            1 354 886 376       -----     +2.394%
s390x              2 916 095 094       -----     +1.236%
sh4                1 990 685 482       -----     +2.677%
sparc64            2 874 141 228       -----     +3.827%
x86_64             1 554 142 522       -----      +2.13%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 412 432 189       -----     +0.313%
alpha              3 233 956 740       -----     +7.472%
arm                8 545 298 231       -----      +1.09%
hppa               3 483 517 882       -----     +4.466%
m68k               3 919 103 883       -----    +18.432%
mips               2 344 653 600       -----     +4.085%
mipsel             3 329 914 037       -----     +5.177%
mips64             2 359 018 408       -----     +4.075%
mips64el           3 343 645 682       -----     +5.166%
ppc                3 209 513 687       -----     +3.248%
ppc64              3 287 495 352       -----     +3.173%
ppc64le            3 287 146 924       -----     +3.172%
riscv64            1 221 611 672       -----     +0.278%
s390x              2 874 160 179       -----     +5.826%
sh4                3 544 095 911       -----      +6.42%
sparc64            3 426 095 341       -----     +7.138%
x86_64             1 249 077 963       -----     +0.335%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              598 861 501       -----     +0.616%
alpha                372 408 394       -----     +0.669%
arm                  746 699 783       -----     +1.478%
hppa                 674 263 485       -----     +1.181%
m68k                 410 563 190       -----     +0.917%
mips                 499 575 815       -----     +0.506%
mipsel               499 526 395       -----     +0.502%
mips64               481 523 625       -----     +0.593%
mips64el             465 055 535       -----     +0.619%
ppc                  341 391 639       -----     +0.961%
ppc64                393 787 766       -----     +0.964%
ppc64le              393 951 060       -----     +0.958%
riscv64              351 689 760       -----     +0.779%
s390x                494 449 944       -----     +0.604%
sh4                  402 820 728       -----     +0.937%
sparc64              495 858 729       -----     +1.173%
x86_64               403 094 436       -----     +0.875%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 709 859 741       -----     +2.424%
alpha              1 969 428 074       -----     +3.679%
arm                8 323 163 802       -----     +2.589%
hppa               3 188 307 460       -----       +2.9%
m68k               4 953 940 638       -----    +15.153%
mips               2 123 798 925       -----      +3.05%
mipsel             2 124 239 757       -----     +3.049%
mips64             1 999 016 852       -----     +3.404%
mips64el           1 996 427 737       -----     +3.409%
ppc                2 819 305 286       -----     +5.436%
ppc64              2 768 177 125       -----     +5.512%
ppc64le            2 724 774 769       -----     +5.602%
riscv64            1 638 317 392       -----      +4.02%
s390x              2 519 120 507       -----     +3.364%
sh4                2 595 697 284       -----       +3.0%
sparc64            3 988 893 487       -----     +2.745%
x86_64             2 033 628 238       -----     +3.243%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 193 579 779       -----     +2.924%
alpha              1 521 259 815       -----     +4.191%
arm                3 465 577 654       -----      +2.76%
hppa               2 280 025 908       -----     +3.821%
m68k               1 843 179 433       -----     +3.583%
mips               1 557 908 487       -----     +3.855%
mipsel             1 560 647 746       -----      +3.85%
mips64             1 563 387 416       -----      +4.41%
mips64el           1 542 678 432       -----     +4.474%
ppc                1 728 755 784       -----     +3.668%
ppc64              1 842 432 968       -----     +3.555%
ppc64le            1 791 795 422       -----     +3.659%
riscv64            1 348 875 406       -----     +4.654%
s390x              2 184 086 031       -----      +3.32%
sh4                1 946 645 302       -----     +3.632%
sparc64            3 452 121 268       -----     +2.934%
x86_64             1 813 707 901       -----     +3.546%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 592 374 884       -----     +2.474%
alpha              1 855 802 554       -----     +3.485%
arm                7 347 822 203       -----     +2.684%
hppa               4 758 746 715       -----     +3.542%
m68k               2 376 775 202       -----     +3.565%
mips               2 166 458 082       -----     +2.525%
mipsel             2 163 385 113       -----     +2.528%
mips64             2 029 226 059       -----     +3.116%
mips64el           2 011 629 545       -----     +3.145%
ppc                2 492 979 524       -----     +2.674%
ppc64              2 464 691 039       -----     +2.487%
ppc64le            2 445 224 305       -----     +2.504%
riscv64            1 625 026 586       -----     +3.952%
s390x              4 194 617 770       -----     +6.623%
sh4                2 164 276 921       -----     +3.173%
sparc64            4 299 395 599       -----     +4.062%
x86_64             2 940 167 964       -----     +2.639%
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 487 973 252       -----     +1.946%
alpha              1 680 688 927       -----     +2.833%
arm               11 563 309 464       -----     +2.849%
hppa               7 272 835 573       -----     +3.263%
m68k               1 998 806 310       -----     +3.198%
mips               1 656 444 316       -----      +1.95%
mipsel             1 659 448 615       -----     +1.946%
mips64             1 955 509 680       -----     +2.446%
mips64el           1 943 599 098       -----     +2.462%
ppc                2 320 387 139       -----     +2.334%
ppc64              2 552 646 787       -----     +2.742%
ppc64le            2 547 351 675       -----     +2.747%
riscv64            1 520 838 526       -----     +3.157%
s390x              5 497 987 421       -----     +1.078%
sh4                2 323 368 460       -----     +3.416%
sparc64            3 426 981 102       -----     +4.726%
x86_64             1 729 500 416       -----     +2.814%
--------------------------------------------------------


</pre></body></html>

--===============2166789138032477778==--

