Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1324326554D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 01:03:54 +0200 (CEST)
Received: from localhost ([::1]:58290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGVbc-0006ob-PF
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 19:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kGVaf-0006OM-DO
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 19:02:53 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:52151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kGVad-00080q-Mz
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 19:02:53 -0400
Received: by mail-wm1-x336.google.com with SMTP id w2so2472045wmi.1
 for <qemu-devel@nongnu.org>; Thu, 10 Sep 2020 16:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=DTJuyGEpxLSMbCwyWl6+Zhhs8VvtTFISusECgL+YMUA=;
 b=VUNfWv3GYE+26HVvESe1moNOimazODEsRfw8KTFXEbYkGP6N6mNcX68T8h7ribWG6u
 pOJXgRlXqLsidmw/AQmAmywSXPiTNOzvaGEUrwN647Dv3EUliRV/ju9UMvtnjvPEYfZO
 EiUe3DamO6ZkH8JsnECB1gjhX0ujWY2UgMUIuUNeXgP/UIy/+9Q/+ma4KBSaHiT+6GxO
 Wov931MhMZO2yR6XH4zV2RIjB9akD9VNYU4OkUclVe7D5Gwh42UlCl+rOsSFBQnz7FVz
 hRfNKcWRIUzpCyjesd/FI45TkzhGtPNbUe/5jxteVH5mgeP0ViP8O7HBH0NGd6x56yF9
 oCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=DTJuyGEpxLSMbCwyWl6+Zhhs8VvtTFISusECgL+YMUA=;
 b=AzsFQao4pkOtiLzGf8E+DvKs6Haj72dV7s4srz4tK0AhwEwqjpJBhEF0PsxExLvqtj
 PDkzRAvvid84f4ZQU+mzyDWFhoL/lbQbU2j6vJdh+8cs4N4bL6x0VvZs5GuZKEtG8q9B
 /JlxpCelhf/D2dzOpHf9BEXtPTNxZnb3scwqXjZ3yVjE3K11V8WXIFcrsZouXU100YQC
 sVdqbw73coHFwwApQZCKYjGLhzBIhrDqM2/P59YVuG3RC40OHsKhdS87eMIK01WObn7X
 wWzFkWji3Ga2fjz8qf/4rGnuy+SKZj2OiDr8cJj2drEO/EKSGn3eAw1CeawDrG20+V7Y
 4wUg==
X-Gm-Message-State: AOAM531xha8FhE1W7YWBPXN6x8OZ7FBP2PVkziiaXKZgrQWt4/Lbcpnz
 t4wvSHoyRyWIoi8WOISWOuB2jOKLY9DVSQ==
X-Google-Smtp-Source: ABdhPJzX4shoWPYP9sA12XRyAA9JCJF/yAksQg+sDW1iUH1M8A5olWeefoBWHcK3NXfag63fvIfZjg==
X-Received: by 2002:a7b:c210:: with SMTP id x16mr2188772wmi.37.1599778968726; 
 Thu, 10 Sep 2020 16:02:48 -0700 (PDT)
Received: from [127.0.1.1] ([197.58.222.12])
 by smtp.gmail.com with ESMTPSA id y5sm365899wmg.21.2020.09.10.16.02.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 16:02:47 -0700 (PDT)
Message-ID: <5f5ab097.1c69fb81.a88a5.0a81@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============0067788902490198713=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 11 Sep 2020 01:02:44 +0200
Subject: [REPORT] Nightly Performance Tests - Thursday, September 10, 2020
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-wm1-x336.google.com
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

--===============0067788902490198713==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-09-10 22:30:02
End Time (UTC)   : 2020-09-10 23:02:44
Execution Time   : 0:32:42.042974

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
aarch64            2 158 530 784       -----     +1.704%
alpha              1 914 942 924       -----     +3.522%
arm                8 076 533 542       -----     +2.308%
hppa               4 261 686 945       -----     +3.163%
m68k               2 690 301 917       -----     +7.134%
mips               1 861 908 658       -----     +2.485%
mipsel             2 008 238 228       -----     +2.676%
mips64             1 918 619 080       -----     +2.817%
mips64el           2 051 558 749       -----     +3.026%
ppc                2 480 186 117       -----      +3.11%
ppc64              2 576 712 845       -----     +3.143%
ppc64le            2 558 834 556       -----     +3.172%
riscv64            1 406 686 610       -----     +2.648%
s390x              3 158 138 926       -----     +3.119%
sh4                2 364 607 396       -----     +3.341%
sparc64            3 318 699 569       -----     +3.855%
x86_64             1 775 939 491       -----     +2.167%
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 062 763 459       -----      +1.43%
alpha              3 191 841 001       -----     +3.695%
arm               16 357 297 933       -----     +2.348%
hppa               7 228 403 780       -----     +3.086%
m68k               4 294 067 102       -----     +9.693%
mips               3 051 322 440       -----     +2.423%
mipsel             3 231 546 639       -----      +2.87%
mips64             3 245 809 829       -----     +2.595%
mips64el           3 414 221 164       -----     +3.021%
ppc                4 914 569 790       -----     +4.741%
ppc64              5 098 154 111       -----     +4.565%
ppc64le            5 082 401 939       -----      +4.58%
riscv64            2 192 269 262       -----     +1.954%
s390x              4 584 587 581       -----     +2.898%
sh4                3 949 198 637       -----     +3.468%
sparc64            4 586 104 691       -----     +4.235%
x86_64             2 484 245 145       -----     +1.757%
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 210 378 588       -----     +1.502%
alpha              1 494 107 106       -----     +2.148%
arm                8 263 049 727       -----     +2.667%
hppa               5 207 320 779       -----     +3.047%
m68k               1 725 888 114       -----     +2.528%
mips               1 495 115 474       -----     +1.484%
mipsel             1 497 166 302       -----      +1.48%
mips64             1 715 414 160       -----     +1.893%
mips64el           1 695 215 089       -----     +1.909%
ppc                2 014 612 573       -----     +1.822%
ppc64              2 206 266 568       -----     +2.138%
ppc64le            2 197 979 170       -----     +2.145%
riscv64            1 354 881 275       -----     +2.393%
s390x              2 916 095 691       -----     +1.236%
sh4                1 990 694 661       -----     +2.678%
sparc64            2 874 141 872       -----     +3.827%
x86_64             1 554 138 280       -----      +2.13%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 412 435 761       -----     +0.313%
alpha              3 233 965 145       -----     +7.472%
arm                8 545 308 485       -----      +1.09%
hppa               3 483 531 263       -----     +4.466%
m68k               3 919 118 884       -----    +18.433%
mips               2 344 652 365       -----     +4.085%
mipsel             3 329 919 269       -----     +5.178%
mips64             2 359 024 447       -----     +4.075%
mips64el           3 343 645 738       -----     +5.166%
ppc                3 209 508 853       -----     +3.248%
ppc64              3 287 502 957       -----     +3.173%
ppc64le            3 287 153 675       -----     +3.172%
riscv64            1 221 606 805       -----     +0.277%
s390x              2 874 163 366       -----     +5.826%
sh4                3 544 105 721       -----      +6.42%
sparc64            3 426 096 125       -----     +7.138%
x86_64             1 249 071 152       -----     +0.334%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              598 864 863       -----     +0.616%
alpha                372 414 237       -----     +0.671%
arm                  746 707 111       -----     +1.479%
hppa                 674 272 873       -----     +1.182%
m68k                 410 580 652       -----     +0.921%
mips                 499 574 846       -----     +0.506%
mipsel               499 528 256       -----     +0.503%
mips64               481 532 174       -----     +0.595%
mips64el             465 054 923       -----     +0.618%
ppc                  341 384 086       -----     +0.959%
ppc64                393 795 623       -----     +0.966%
ppc64le              393 960 396       -----      +0.96%
riscv64              351 687 309       -----     +0.779%
s390x                494 450 640       -----     +0.604%
sh4                  402 830 492       -----      +0.94%
sparc64              495 859 497       -----     +1.173%
x86_64               403 084 915       -----     +0.872%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 709 863 029       -----     +2.424%
alpha              1 969 439 178       -----     +3.679%
arm                8 323 171 662       -----     +2.589%
hppa               3 188 321 174       -----       +2.9%
m68k               4 953 955 479       -----    +15.153%
mips               2 123 797 225       -----      +3.05%
mipsel             2 124 245 267       -----     +3.049%
mips64             1 999 025 547       -----     +3.404%
mips64el           1 996 425 900       -----     +3.409%
ppc                2 819 303 133       -----     +5.436%
ppc64              2 768 184 484       -----     +5.513%
ppc64le            2 724 784 344       -----     +5.603%
riscv64            1 638 315 172       -----      +4.02%
s390x              2 519 121 166       -----     +3.364%
sh4                2 595 707 021       -----     +3.001%
sparc64            3 988 894 171       -----     +2.745%
x86_64             2 033 621 227       -----     +3.242%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 193 582 978       -----     +2.925%
alpha              1 521 265 687       -----     +4.191%
arm                3 465 586 950       -----      +2.76%
hppa               2 280 038 450       -----     +3.821%
m68k               1 843 194 263       -----     +3.583%
mips               1 557 907 115       -----     +3.855%
mipsel             1 560 655 719       -----     +3.851%
mips64             1 563 396 142       -----     +4.411%
mips64el           1 542 678 568       -----     +4.474%
ppc                1 728 753 603       -----     +3.668%
ppc64              1 842 443 090       -----     +3.555%
ppc64le            1 791 802 082       -----      +3.66%
riscv64            1 348 872 936       -----     +4.654%
s390x              2 184 086 583       -----      +3.32%
sh4                1 946 655 083       -----     +3.633%
sparc64            3 452 122 015       -----     +2.934%
x86_64             1 813 700 562       -----     +3.546%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 592 380 801       -----     +2.474%
alpha              1 855 811 010       -----     +3.486%
arm                7 347 829 719       -----     +2.684%
hppa               4 758 759 606       -----     +3.543%
m68k               2 376 789 657       -----     +3.566%
mips               2 166 456 607       -----     +2.525%
mipsel             2 163 390 517       -----     +2.528%
mips64             2 029 232 065       -----     +3.116%
mips64el           2 011 629 663       -----     +3.145%
ppc                2 492 974 714       -----     +2.674%
ppc64              2 464 701 159       -----     +2.488%
ppc64le            2 445 233 729       -----     +2.505%
riscv64            1 625 024 128       -----     +3.951%
s390x              4 194 618 404       -----     +6.623%
sh4                2 164 286 704       -----     +3.173%
sparc64            4 299 396 367       -----     +4.062%
x86_64             2 940 161 055       -----     +2.638%
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 487 976 795       -----     +1.947%
alpha              1 680 700 035       -----     +2.834%
arm               11 563 316 755       -----     +2.849%
hppa               7 272 847 637       -----     +3.263%
m68k               1 998 821 185       -----     +3.198%
mips               1 656 443 199       -----      +1.95%
mipsel             1 659 453 855       -----     +1.947%
mips64             1 955 518 278       -----     +2.446%
mips64el           1 943 598 954       -----     +2.462%
ppc                2 320 382 187       -----     +2.334%
ppc64              2 552 654 771       -----     +2.742%
ppc64le            2 547 361 116       -----     +2.748%
riscv64            1 520 835 998       -----     +3.157%
s390x              5 497 987 980       -----     +1.078%
sh4                2 323 380 855       -----     +3.417%
sparc64            3 426 981 821       -----     +4.726%
x86_64             1 729 493 593       -----     +2.814%
--------------------------------------------------------


</pre></body></html>

--===============0067788902490198713==--

