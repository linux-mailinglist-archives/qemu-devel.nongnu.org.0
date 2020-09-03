Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F092F25CE2D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 01:03:35 +0200 (CEST)
Received: from localhost ([::1]:50276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDyGU-0001T3-IQ
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 19:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kDyFb-00012y-Ig
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 19:02:39 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kDyFZ-0005ZR-Ll
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 19:02:39 -0400
Received: by mail-wr1-x435.google.com with SMTP id z1so4903880wrt.3
 for <qemu-devel@nongnu.org>; Thu, 03 Sep 2020 16:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=Nc5OC8BGB8Qp+L1hm/bLqL0AzrYZCbgAD4Y6ETEREYE=;
 b=NSjdjJIv2r8O/jDTbkup/fZgPhDJ6F9nbOE9J9Y4uNgoNd2hqTz7cGSvYdbRSRMXnB
 S0DhvEODZXZydgMRJQ5VLjbSvd7gcmMKXkf7qNQ867YCtc/2oRV9iTx07GnVFfYvE0PM
 MC25LRa0pDNVC/bg+26Px6IRAHblSUYoOqrlOG0W9NrCZjZgaLIIe+QMnlbJENtlAw+n
 FVoXRyAD/HF2YURL1rszoX2j3oy9fpfRSMDBwRLV2Zox86/GCo5EYglXqZfr8wCfEDSw
 vpB9bMJqOh/m/PlJPje+93Qh6esGm5uahAUp0h728U56eeSusnXFgH7sQfB+zLcLVeqN
 0Prg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=Nc5OC8BGB8Qp+L1hm/bLqL0AzrYZCbgAD4Y6ETEREYE=;
 b=qI713E2/rtPwhYyTX8sa5sVuzfA8A46qrg2wX8mimy5/axgu2GsqiySOb9PQfiR+aW
 qIuaKoG5JukbpxP6+BEA8FThxAtxiyNiPVkJodKnUhKkwBcQkByS7u1EEJa4oBz6H4Pn
 3AnuLjIa2RXDxILI9vG9Q2lKYei+OiIAJc6Wzbe3s2Q66V4f2UI+EdxtTPHQZXFn1831
 8xg/ir874wdP6fFUnTwHjj54lgymG/mZ5k52u2s+l2ntPigBS5rM3Yh7eofUI+HhDZcB
 5HeLgrsUUBHXgLjpasbtK8G4oaeJdPNsiT6zo1YZaU24KkUD2ks0rFCz6Xm/TeFtXpBM
 nUTg==
X-Gm-Message-State: AOAM532YRZwst8z6rllsWwaal7CUc9BhlL4ME2cu16ll1NVn2mpzOleI
 vhk8WmeDaSKOiWFSSKGZnlyJLYYCAjywsg==
X-Google-Smtp-Source: ABdhPJxOxjKAbBmLGNwBUhn+7kmoiXb7Vmo98icMxj7Th4OPMcEhOqL+004/+46T3ZO/lxfsw2i3qA==
X-Received: by 2002:adf:f203:: with SMTP id p3mr4689119wro.339.1599174154232; 
 Thu, 03 Sep 2020 16:02:34 -0700 (PDT)
Received: from [127.0.1.1] ([41.40.226.113])
 by smtp.gmail.com with ESMTPSA id r13sm7296739wrj.83.2020.09.03.16.02.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 16:02:33 -0700 (PDT)
Message-ID: <5f517609.1c69fb81.4a0fa.5284@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============4371866488289812484=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 04 Sep 2020 01:02:32 +0200
Subject: [REPORT] Nightly Performance Tests - Thursday, September 3, 2020
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-wr1-x435.google.com
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

--===============4371866488289812484==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-09-03 22:30:01
End Time (UTC)   : 2020-09-03 23:02:32
Execution Time   : 0:32:30.542730

Status           : SUCCESS

Note:
Changes denoted by '-----' are less than 0.01%.

--------------------------------------------------------
            SUMMARY REPORT - COMMIT 67a7bfe5
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 158 367 755       -----     +1.694%
alpha              1 914 960 995       -----     +3.524%
arm                8 076 520 721       -----     +2.308%
hppa               4 261 664 764       -----     +3.163%
m68k               2 690 290 514       -----     +7.134%
mips               1 862 051 405       -----     +2.495%
mipsel             2 008 225 202       -----     +2.675%
mips64             1 918 629 510       -----     +2.818%
mips64el           2 051 549 378       -----     +3.025%
ppc                2 480 156 856       -----     +3.108%
ppc64              2 576 717 767       -----     +3.143%
ppc64le            2 558 850 374       -----     +3.172%
riscv64            1 406 711 802       -----     +2.651%
s390x              3 158 134 609       -----     +3.118%
sh4                2 364 458 411       -----     +3.331%
sparc64            3 318 813 316       -----     +3.861%
x86_64             1 775 808 298       -----     +2.156%
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 062 601 465       -----     +1.424%
alpha              3 191 859 003       -----     +3.696%
arm               16 357 291 602       -----     +2.348%
hppa               7 228 382 065       -----     +3.086%
m68k               4 294 056 156       -----     +9.693%
mips               3 051 465 554       -----     +2.428%
mipsel             3 231 534 555       -----      +2.87%
mips64             3 245 821 920       -----     +2.596%
mips64el           3 414 211 292       -----     +3.021%
ppc                4 914 541 834       -----      +4.74%
ppc64              5 098 157 130       -----     +4.565%
ppc64le            5 082 415 071       -----      +4.58%
riscv64            2 192 296 198       -----     +1.955%
s390x              4 584 583 479       -----     +2.897%
sh4                3 949 049 364       -----     +3.464%
sparc64            4 586 218 963       -----     +4.238%
x86_64             2 484 115 032       -----     +1.751%
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 210 216 632       -----     +1.494%
alpha              1 494 125 156       -----      +2.15%
arm                8 263 036 399       -----     +2.666%
hppa               5 207 297 927       -----     +3.046%
m68k               1 725 877 340       -----     +2.528%
mips               1 495 255 900       -----     +1.494%
mipsel             1 497 151 612       -----     +1.479%
mips64             1 715 424 355       -----     +1.894%
mips64el           1 695 205 171       -----     +1.909%
ppc                2 014 582 478       -----     +1.821%
ppc64              2 206 273 897       -----     +2.139%
ppc64le            2 197 997 803       -----     +2.146%
riscv64            1 354 908 557       -----     +2.395%
s390x              2 916 091 851       -----     +1.236%
sh4                1 990 545 408       -----      +2.67%
sparc64            2 874 255 135       -----     +3.831%
x86_64             1 554 005 310       -----     +2.121%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 412 273 024       -----     +0.302%
alpha              3 233 985 929       -----     +7.473%
arm                8 545 294 928       -----      +1.09%
hppa               3 483 506 780       -----     +4.466%
m68k               3 919 107 825       -----    +18.433%
mips               2 344 795 311       -----     +4.092%
mipsel             3 329 907 371       -----     +5.177%
mips64             2 359 034 683       -----     +4.075%
mips64el           3 343 635 539       -----     +5.166%
ppc                3 209 478 570       -----     +3.247%
ppc64              3 287 507 800       -----     +3.173%
ppc64le            3 287 169 716       -----     +3.173%
riscv64            1 221 631 377       -----     +0.279%
s390x              2 874 159 547       -----     +5.826%
sh4                3 543 956 370       -----     +6.416%
sparc64            3 426 209 348       -----     +7.141%
x86_64             1 248 940 936       -----     +0.324%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              598 699 339       -----     +0.588%
alpha                372 432 320       -----     +0.675%
arm                  746 694 102       -----     +1.477%
hppa                 674 253 161       -----      +1.18%
m68k                 410 567 304       -----     +0.918%
mips                 499 717 780       -----     +0.535%
mipsel               499 516 253       -----       +0.5%
mips64               481 542 368       -----     +0.597%
mips64el             465 048 085       -----     +0.617%
ppc                  341 356 851       -----     +0.951%
ppc64                393 799 930       -----     +0.967%
ppc64le              393 976 171       -----     +0.964%
riscv64              351 711 777       -----     +0.786%
s390x                494 444 100       -----     +0.602%
sh4                  402 683 857       -----     +0.903%
sparc64              495 975 319       -----     +1.196%
x86_64               402 954 563       -----      +0.84%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 709 700 993       -----     +2.418%
alpha              1 969 454 638       -----      +3.68%
arm                8 323 157 462       -----     +2.589%
hppa               3 188 299 169       -----       +2.9%
m68k               4 953 945 318       -----    +15.153%
mips               2 123 940 465       -----     +3.056%
mipsel             2 124 230 535       -----     +3.048%
mips64             1 999 035 598       -----     +3.405%
mips64el           1 996 417 857       -----     +3.408%
ppc                2 819 275 316       -----     +5.435%
ppc64              2 768 189 776       -----     +5.513%
ppc64le            2 724 800 733       -----     +5.603%
riscv64            1 638 341 686       -----     +4.022%
s390x              2 519 116 843       -----     +3.364%
sh4                2 595 557 617       -----     +2.995%
sparc64            3 989 007 473       -----     +2.747%
x86_64             2 033 491 139       -----     +3.236%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 193 417 967       -----     +2.917%
alpha              1 521 283 720       -----     +4.192%
arm                3 465 571 588       -----     +2.759%
hppa               2 280 016 198       -----      +3.82%
m68k               1 843 180 988       -----     +3.583%
mips               1 558 050 333       -----     +3.864%
mipsel             1 560 641 111       -----      +3.85%
mips64             1 563 406 303       -----     +4.412%
mips64el           1 542 668 473       -----     +4.473%
ppc                1 728 723 425       -----     +3.666%
ppc64              1 842 448 140       -----     +3.556%
ppc64le            1 791 816 042       -----      +3.66%
riscv64            1 348 897 713       -----     +4.656%
s390x              2 184 082 608       -----      +3.32%
sh4                1 946 505 722       -----     +3.625%
sparc64            3 452 235 426       -----     +2.938%
x86_64             1 813 567 782       -----     +3.538%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 592 218 320       -----     +2.468%
alpha              1 855 829 097       -----     +3.487%
arm                7 347 816 157       -----     +2.684%
hppa               4 758 737 404       -----     +3.542%
m68k               2 376 778 714       -----     +3.566%
mips               2 166 599 691       -----     +2.532%
mipsel             2 163 378 309       -----     +2.528%
mips64             2 029 242 308       -----     +3.117%
mips64el           2 011 619 411       -----     +3.144%
ppc                2 492 944 309       -----     +2.673%
ppc64              2 464 706 170       -----     +2.488%
ppc64le            2 445 250 111       -----     +2.505%
riscv64            1 625 048 967       -----     +3.953%
s390x              4 194 614 471       -----     +6.623%
sh4                2 164 137 396       -----     +3.166%
sparc64            4 299 509 784       -----     +4.064%
x86_64             2 940 028 296       -----     +2.634%
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 487 814 306       -----      +1.94%
alpha              1 680 718 104       -----     +2.835%
arm               11 563 303 534       -----     +2.849%
hppa               7 272 825 413       -----     +3.263%
m68k               1 998 810 467       -----     +3.198%
mips               1 656 586 213       -----     +1.959%
mipsel             1 659 441 872       -----     +1.946%
mips64             1 955 528 545       -----     +2.447%
mips64el           1 943 589 196       -----     +2.462%
ppc                2 320 352 072       -----     +2.332%
ppc64              2 552 659 293       -----     +2.742%
ppc64le            2 547 377 346       -----     +2.749%
riscv64            1 520 858 147       -----     +3.158%
s390x              5 497 983 978       -----     +1.078%
sh4                2 323 231 560       -----      +3.41%
sparc64            3 427 095 082       -----     +4.729%
x86_64             1 729 363 333       -----     +2.806%
--------------------------------------------------------


</pre></body></html>

--===============4371866488289812484==--

