Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7C5262357
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 01:04:12 +0200 (CEST)
Received: from localhost ([::1]:46974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFmep-0007ID-1y
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 19:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kFme5-0006s5-Qn
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 19:03:25 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:55599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kFme3-0001sm-PF
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 19:03:25 -0400
Received: by mail-wm1-x331.google.com with SMTP id a65so511082wme.5
 for <qemu-devel@nongnu.org>; Tue, 08 Sep 2020 16:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=iCXlKhYjl/uta2JI0UadEM6r4fp2/gqMLq1qlcE/0ag=;
 b=VjfDyMhSGJb6kOTJxkNbZ1VHOjM8WQoGRHXdNzPvv2Y8s0hDVn2P1unfVWPQ1VMkCm
 XokxOAXZPWgF4tUJaBRnW9Ln+0CSidZfXdYWZe58oM+3Elmecn2HG9Y+H1tgYnPh8RBd
 Cu4jctdGo9xN0qyptOrkNKLEcNu4qj/6HGvPEDxEoOjGf7Y8bzOwmRKoJwrXl1qYaVvq
 PBSyMnuE84y28GstignXLJGEfOdHPhKhboZkDxF+uee+fjc+3KRmlk6e5I9UiloWPZr1
 tRsUt8yTKgcoEf/KftNYoUsfmDkEna47urWM6TWpfNF0gYQwVHfvtAv0x/O4plW8OVc/
 AJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=iCXlKhYjl/uta2JI0UadEM6r4fp2/gqMLq1qlcE/0ag=;
 b=Ea3n89HY6gyF7w48ja89nVPNrHQaBitxwypLQXmEMWkG73a3gHe3lx4da4MEp/9cEL
 4M/aUYFak74pG9tm7LltWdNL4MjiX3knhTlJEdqukM5YweF+DrCG580ru2BccuWCEAMO
 4Iucjmu9iwXs7yexqrBwH1LXoLAvIg9Mhpc6eEkp46rUJQVVg3QMIDBnH5SaCLl5UFnH
 1THOCtPoBtQXWSkJvdBO7u/QCZDHmqnYy6Q+oV+ZRJpNzICSTTvfwrf7ew8AidqBDZm/
 mQN1sc80K4lfpPEM1HtbNdXZ51KmN1SZrFPwpUwFqna09tfDOODedXBTWVIpJhdjA1UZ
 4qXQ==
X-Gm-Message-State: AOAM530JJ7vXKeziDyBq4s4xZq7WURTuRt7NKh7Ezfl6+/osC2ONdYO+
 BK/ySAIiwgjfRy99Pq9/Is04+WLys5+yxA==
X-Google-Smtp-Source: ABdhPJz2oUy6S8PXNTIB5Mfv2s4oFRs0aD2i20zfMhaIGhTeAo6m73Rq6qIZ/K4CRDfs5Sh1Lt0pCw==
X-Received: by 2002:a1c:988d:: with SMTP id a135mr636656wme.8.1599606201165;
 Tue, 08 Sep 2020 16:03:21 -0700 (PDT)
Received: from [127.0.1.1] ([197.58.143.120])
 by smtp.gmail.com with ESMTPSA id 91sm1499335wrq.9.2020.09.08.16.03.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 16:03:20 -0700 (PDT)
Message-ID: <5f580db8.1c69fb81.705e7.4cb6@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============7355835734244067137=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 09 Sep 2020 01:03:19 +0200
Subject: [REPORT] Nightly Performance Tests - Tuesday, September 8, 2020
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-wm1-x331.google.com
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

--===============7355835734244067137==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-09-08 22:30:02
End Time (UTC)   : 2020-09-08 23:03:19
Execution Time   : 0:33:16.914858

Status           : SUCCESS

Note:
Changes denoted by '-----' are less than 0.01%.

--------------------------------------------------------
            SUMMARY REPORT - COMMIT 67790385
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 158 526 758       -----     +1.704%
alpha              1 914 949 603       -----     +3.523%
arm                8 076 536 751       -----     +2.308%
hppa               4 261 694 044       -----     +3.164%
m68k               2 690 302 191       -----     +7.135%
mips               1 861 899 373       -----     +2.484%
mipsel             2 008 222 249       -----     +2.675%
mips64             1 918 624 363       -----     +2.817%
mips64el           2 051 551 547       -----     +3.025%
ppc                2 480 197 737       -----     +3.111%
ppc64              2 576 708 052       -----     +3.142%
ppc64le            2 558 825 498       -----     +3.171%
riscv64            1 406 678 911       -----     +2.647%
s390x              3 158 128 812       -----     +3.118%
sh4                2 364 598 659       -----     +3.341%
sparc64            3 318 700 221       -----     +3.855%
x86_64             1 775 940 947       -----     +2.167%
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 062 759 323       -----      +1.43%
alpha              3 191 847 048       -----     +3.695%
arm               16 357 300 631       -----     +2.348%
hppa               7 228 408 847       -----     +3.086%
m68k               4 294 067 760       -----     +9.693%
mips               3 051 313 439       -----     +2.423%
mipsel             3 231 530 724       -----     +2.869%
mips64             3 245 816 156       -----     +2.596%
mips64el           3 414 213 537       -----     +3.021%
ppc                4 914 582 254       -----     +4.741%
ppc64              5 098 145 682       -----     +4.565%
ppc64le            5 082 392 870       -----     +4.579%
riscv64            2 192 263 039       -----     +1.954%
s390x              4 584 577 681       -----     +2.897%
sh4                3 949 190 599       -----     +3.468%
sparc64            4 586 105 365       -----     +4.235%
x86_64             2 484 245 841       -----     +1.757%
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 210 374 595       -----     +1.502%
alpha              1 494 113 126       -----     +2.149%
arm                8 263 054 865       -----     +2.667%
hppa               5 207 327 123       -----     +3.047%
m68k               1 725 888 200       -----     +2.528%
mips               1 495 106 430     -0.011%     +1.484%
mipsel             1 497 151 197       -----     +1.479%
mips64             1 715 420 469       -----     +1.893%
mips64el           1 695 205 871       -----     +1.909%
ppc                2 014 623 828       -----     +1.823%
ppc64              2 206 264 991       -----     +2.138%
ppc64le            2 197 972 278       -----     +2.145%
riscv64            1 354 872 661       -----     +2.393%
s390x              2 916 085 978       -----     +1.236%
sh4                1 990 686 615       -----     +2.677%
sparc64            2 874 142 528       -----     +3.827%
x86_64             1 554 139 013       -----      +2.13%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 412 431 616     +0.011%     +0.313%
alpha              3 233 973 783       -----     +7.473%
arm                8 545 311 751       -----      +1.09%
hppa               3 483 537 736       -----     +4.467%
m68k               3 919 119 423       -----    +18.433%
mips               2 344 643 485       -----     +4.085%
mipsel             3 329 903 673       -----     +5.177%
mips64             2 359 030 673       -----     +4.075%
mips64el           3 343 638 926       -----     +5.166%
ppc                3 209 520 534       -----     +3.248%
ppc64              3 287 498 674       -----     +3.173%
ppc64le            3 287 144 511       -----     +3.172%
riscv64            1 221 600 705       -----     +0.277%
s390x              2 874 153 656       -----     +5.825%
sh4                3 544 097 624       -----      +6.42%
sparc64            3 426 096 787       -----     +7.138%
x86_64             1 249 074 893       -----     +0.335%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              598 860 970     +0.025%     +0.616%
alpha                372 420 278     -0.011%     +0.672%
arm                  746 710 827       -----      +1.48%
hppa                 674 283 293       -----     +1.184%
m68k                 410 580 755       -----     +0.921%
mips                 499 565 830     -0.034%     +0.504%
mipsel               499 515 320       -----       +0.5%
mips64               481 535 869       -----     +0.595%
mips64el             465 051 255       -----     +0.618%
ppc                  341 394 538       -----     +0.962%
ppc64                393 791 295       -----     +0.964%
ppc64le              393 950 902       -----     +0.958%
riscv64              351 678 777     -0.014%     +0.776%
s390x                494 438 276       -----     +0.601%
sh4                  402 822 439     +0.027%     +0.938%
sparc64              495 860 072     -0.024%     +1.173%
x86_64               403 088 279      +0.03%     +0.873%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 709 858 949       -----     +2.424%
alpha              1 969 445 177       -----      +3.68%
arm                8 323 174 254       -----     +2.589%
hppa               3 188 327 455       -----     +2.901%
m68k               4 953 956 195       -----    +15.153%
mips               2 123 788 335       -----     +3.049%
mipsel             2 124 229 382       -----     +3.048%
mips64             1 999 031 780       -----     +3.404%
mips64el           1 996 421 170       -----     +3.408%
ppc                2 819 315 711       -----     +5.437%
ppc64              2 768 180 503       -----     +5.512%
ppc64le            2 724 774 987       -----     +5.602%
riscv64            1 638 306 433       -----     +4.019%
s390x              2 519 111 133       -----     +3.364%
sh4                2 595 698 803       -----       +3.0%
sparc64            3 988 894 904       -----     +2.745%
x86_64             2 033 622 050       -----     +3.242%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 193 579 134       -----     +2.924%
alpha              1 521 274 307       -----     +4.192%
arm                3 465 588 371       -----      +2.76%
hppa               2 280 045 930       -----     +3.822%
m68k               1 843 194 342       -----     +3.583%
mips               1 557 898 182     -0.011%     +3.854%
mipsel             1 560 639 956       -----      +3.85%
mips64             1 563 399 713       -----     +4.411%
mips64el           1 542 669 033       -----     +4.473%
ppc                1 728 765 317       -----     +3.669%
ppc64              1 842 438 891       -----     +3.555%
ppc64le            1 791 792 496       -----     +3.659%
riscv64            1 348 864 180       -----     +4.653%
s390x              2 184 076 910       -----     +3.319%
sh4                1 946 644 375       -----     +3.632%
sparc64            3 452 122 643       -----     +2.934%
x86_64             1 813 701 414       -----     +3.546%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 592 376 859       -----     +2.474%
alpha              1 855 817 053       -----     +3.486%
arm                7 347 832 976       -----     +2.684%
hppa               4 758 766 618       -----     +3.543%
m68k               2 376 789 589       -----     +3.566%
mips               2 166 445 063       -----     +2.524%
mipsel             2 163 372 096       -----     +2.527%
mips64             2 029 235 692       -----     +3.116%
mips64el           2 011 620 223       -----     +3.144%
ppc                2 492 986 393       -----     +2.675%
ppc64              2 464 696 887       -----     +2.487%
ppc64le            2 445 224 199       -----     +2.504%
riscv64            1 625 018 148       -----     +3.951%
s390x              4 194 608 668       -----     +6.623%
sh4                2 164 278 615       -----     +3.173%
sparc64            4 299 396 981       -----     +4.062%
x86_64             2 940 161 819       -----     +2.638%
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 487 972 620       -----     +1.946%
alpha              1 680 706 055       -----     +2.834%
arm               11 563 320 336       -----     +2.849%
hppa               7 272 855 351       -----     +3.263%
m68k               1 998 821 264       -----     +3.199%
mips               1 656 434 225       -----     +1.949%
mipsel             1 659 435 651       -----     +1.946%
mips64             1 955 524 557       -----     +2.447%
mips64el           1 943 592 364       -----     +2.462%
ppc                2 320 393 325       -----     +2.334%
ppc64              2 552 647 500       -----     +2.742%
ppc64le            2 547 351 746       -----     +2.748%
riscv64            1 520 827 346       -----     +3.156%
s390x              5 497 978 196       -----     +1.078%
sh4                2 323 370 208       -----     +3.416%
sparc64            3 426 982 491       -----     +4.726%
x86_64             1 729 494 268       -----     +2.814%
--------------------------------------------------------


</pre></body></html>

--===============7355835734244067137==--

