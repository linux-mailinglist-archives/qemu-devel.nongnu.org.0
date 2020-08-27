Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEECA2550E9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 00:04:36 +0200 (CEST)
Received: from localhost ([::1]:52098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBQ0Z-0006sD-HP
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 18:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kBPzP-0006Pf-5a
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 18:03:23 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kBPzN-0003Xz-AS
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 18:03:22 -0400
Received: by mail-wm1-x32b.google.com with SMTP id q9so4349455wmj.2
 for <qemu-devel@nongnu.org>; Thu, 27 Aug 2020 15:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=tzy7e+faoAdqD/OIMeO6ym13wn/WQTiVWDFHtWbep4s=;
 b=ntukAiXT2fXO5cKreF/Zyg61yslE17qF47cQLXktUQVOoIh0uB2KQsYu35IwPh8JGq
 jc2EeS5zAa0h//qL6QlbWw3SoxlTLJIHcDxbSYrAswAOArtE9U0Tl2+4cTFgbs875FPg
 qMz9cU85o0LoJGDamPhWKfXaEw/nS37aonhSJR1gREZAC/eIkIMNPpidWwYCgkS/TXZf
 TPs1/HYpBjTt8RhWHwYL54EcsDMK6/vc33qLfXUZY3XncJAPDrHqe6ZrI0uqAJuwv4Vy
 pr8sW9UzAmMfrX3PKrzGi7rkBAo4sdnFeOouSKk3hJVe1UXK/hSpLXLdNMURa5GlOpLr
 KkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=tzy7e+faoAdqD/OIMeO6ym13wn/WQTiVWDFHtWbep4s=;
 b=Kz+DQWh8C1QJfH4Z849ZAsQBzavaY+BFsOx2pkKSSclBiO7hegwYsSgj0aeuTVCMtI
 7PHhOrMNG/ZIfAYBmr3/T1YGwMmXA91zvncZfuAxT4IqHcyewk9ZDXJWwOqY9jvdPZrG
 WMkUa+Ss9iV6fZeyOpmVfkavwzOhH+tG2+3YyfKzayD7ZPERhVrOKQ34/7NrGlncAp8p
 whoFxybUFGnHcLYy8qvdH6cLGei3kpCoqXPv8IoiSGytkRytZT14alVwC0jyCBZ/e9Gt
 IdlWjtol7Wb/3brIkuxgKLp0f0IbQJBf5PAymEFfWj1Ar/HH5qb/tLh9GOyewMATjl/S
 U4Cw==
X-Gm-Message-State: AOAM533kM1Haa9CFXCdnD9o3WrOkqyT/XNT2X3NeJSxiDmux3WTchFQW
 Dutb+uJqSioJWE1Dj+5yJWm+quRSmhJDMg==
X-Google-Smtp-Source: ABdhPJwAKRZb0sysf1Ze64tf+3cSS+hgvvNCO9ztaDg1P7u2PBYjAGRh5Y1y5W/k9rgGH2MFCkYxmw==
X-Received: by 2002:a05:600c:2257:: with SMTP id
 a23mr897988wmm.102.1598565798896; 
 Thu, 27 Aug 2020 15:03:18 -0700 (PDT)
Received: from [127.0.1.1] ([197.58.77.158])
 by smtp.gmail.com with ESMTPSA id o124sm7892672wmb.2.2020.08.27.15.03.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 15:03:18 -0700 (PDT)
Message-ID: <5f482da6.1c69fb81.ceddd.eb89@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============4955798842092476077=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 28 Aug 2020 00:02:58 +0200
Subject: [REPORT] Nightly Performance Tests - Thursday, August 27, 2020
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-wm1-x32b.google.com
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

--===============4955798842092476077==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-08-27 21:30:03
End Time (UTC)   : 2020-08-27 22:02:58
Execution Time   : 0:32:54.920498

Status           : SUCCESS

Note:
Changes denoted by '-----' are less than 0.01%.

--------------------------------------------------------
            SUMMARY REPORT - COMMIT ac8b279f
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 158 342 191       -----     +1.692%
alpha              1 914 972 140       -----     +3.524%
arm                8 076 404 894       -----     +2.304%
hppa               4 261 677 507       -----     +3.163%
m68k               2 690 269 887       -----     +7.131%
mips               1 862 023 330       -----     +2.493%
mipsel             2 008 211 753       -----     +2.674%
mips64             1 918 645 078       -----     +2.819%
mips64el           2 051 567 505       -----     +3.026%
ppc                2 480 144 777       -----     +3.107%
ppc64              2 576 714 380       -----     +3.143%
ppc64le            2 558 865 873       -----     +3.174%
riscv64            1 406 706 168       -----      +2.65%
s390x              3 158 131 808       -----     +3.118%
sh4                2 364 459 082       -----     +3.331%
sparc64            3 318 544 351       -----     +3.851%
x86_64             1 775 843 892       -----     +2.156%
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 062 573 443       -----     +1.423%
alpha              3 191 869 281       -----     +3.696%
arm               16 357 166 524       -----     +2.347%
hppa               7 228 367 299       -----     +3.086%
m68k               4 294 012 030       -----     +9.692%
mips               3 051 408 507       -----     +2.426%
mipsel             3 231 507 917       -----     +2.869%
mips64             3 245 845 593       -----     +2.597%
mips64el           3 414 200 419       -----     +3.021%
ppc                4 914 524 698       -----      +4.74%
ppc64              5 098 153 878       -----     +4.565%
ppc64le            5 082 431 528       -----      +4.58%
riscv64            2 192 299 393       -----     +1.956%
s390x              4 584 495 872       -----     +2.896%
sh4                3 949 047 442       -----     +3.464%
sparc64            4 586 202 504       -----     +4.237%
x86_64             2 484 092 820       -----      +1.75%
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 210 183 548       -----     +1.493%
alpha              1 494 137 977       -----     +2.151%
arm                8 262 937 192       -----     +2.665%
hppa               5 207 309 118       -----     +3.047%
m68k               1 725 855 550       -----     +2.526%
mips               1 495 219 108       -----     +1.491%
mipsel             1 497 148 185       -----     +1.479%
mips64             1 715 400 005       -----     +1.892%
mips64el           1 695 276 461       -----     +1.913%
ppc                2 014 561 870       -----      +1.82%
ppc64              2 206 270 729       -----     +2.139%
ppc64le            2 198 010 960       -----     +2.147%
riscv64            1 354 914 552       -----     +2.396%
s390x              2 916 239 244       -----     +1.241%
sh4                1 990 540 028       -----      +2.67%
sparc64            2 872 232 498       -----     +3.758%
x86_64             1 553 979 956       -----      +2.12%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 412 257 235       -----       +0.3%
alpha              3 233 996 079       -----     +7.473%
arm                8 545 175 267       -----     +1.088%
hppa               3 483 588 720       -----     +4.468%
m68k               3 919 060 938       -----    +18.431%
mips               2 344 763 701       -----      +4.09%
mipsel             3 329 889 270       -----     +5.177%
mips64             2 359 056 141       -----     +4.076%
mips64el           3 343 666 860       -----     +5.167%
ppc                3 209 460 983       -----     +3.246%
ppc64              3 287 504 329       -----     +3.173%
ppc64le            3 287 201 718       -----     +3.174%
riscv64            1 221 605 283       -----     +0.277%
s390x              2 874 191 854       -----     +5.827%
sh4                3 543 954 214       -----     +6.416%
sparc64            3 426 149 004       -----     +7.139%
x86_64             1 248 915 648       -----     +0.322%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              598 668 019       -----     +0.583%
alpha                372 444 726       -----     +0.679%
arm                  746 584 516       -----     +1.463%
hppa                 674 271 886       -----     +1.182%
m68k                 410 491 630       -----     +0.899%
mips                 499 688 462       -----     +0.529%
mipsel               499 500 400       -----     +0.497%
mips64               481 562 364       -----     +0.601%
mips64el             465 059 301       -----     +0.619%
ppc                  341 336 385       -----     +0.945%
ppc64                393 797 020       -----     +0.966%
ppc64le              393 991 936       -----     +0.968%
riscv64              351 714 171       -----     +0.786%
s390x                494 419 555       -----     +0.597%
sh4                  402 678 432       -----     +0.902%
sparc64              495 954 405       -----     +1.192%
x86_64               402 929 631       -----     +0.833%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 709 670 154       -----     +2.417%
alpha              1 969 467 478       -----     +3.681%
arm                8 322 999 772       -----     +2.587%
hppa               3 188 292 754       -----     +2.899%
m68k               4 953 925 611       -----    +15.153%
mips               2 123 908 829       -----     +3.055%
mipsel             2 124 215 691       -----     +3.048%
mips64             1 999 058 287       -----     +3.406%
mips64el           1 996 428 801       -----     +3.409%
ppc                2 819 272 012       -----     +5.435%
ppc64              2 768 185 935       -----     +5.513%
ppc64le            2 724 816 624       -----     +5.604%
riscv64            1 638 330 992       -----     +4.021%
s390x              2 519 071 065       -----     +3.362%
sh4                2 595 555 332       -----     +2.995%
sparc64            3 988 985 621       -----     +2.747%
x86_64             2 033 466 823       -----     +3.234%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 193 379 084       -----     +2.915%
alpha              1 521 296 564       -----     +4.193%
arm                3 465 443 814       -----     +2.756%
hppa               2 280 025 131       -----     +3.821%
m68k               1 843 187 493       -----     +3.583%
mips               1 558 014 236       -----     +3.862%
mipsel             1 560 584 414       -----     +3.846%
mips64             1 563 427 391       -----     +4.413%
mips64el           1 542 676 897       -----     +4.474%
ppc                1 728 703 376       -----     +3.665%
ppc64              1 842 444 879       -----     +3.555%
ppc64le            1 791 831 378       -----     +3.661%
riscv64            1 348 867 895       -----     +4.654%
s390x              2 184 065 322       -----     +3.319%
sh4                1 946 500 229       -----     +3.624%
sparc64            3 452 214 502       -----     +2.937%
x86_64             1 813 542 869       -----     +3.537%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 592 204 871       -----     +2.467%
alpha              1 855 836 702       -----     +3.487%
arm                7 347 722 531       -----     +2.682%
hppa               4 758 747 386       -----     +3.542%
m68k               2 376 810 360       -----     +3.567%
mips               2 166 600 003       -----     +2.532%
mipsel             2 163 392 522       -----     +2.528%
mips64             2 029 261 214       -----     +3.118%
mips64el           2 011 630 799       -----     +3.145%
ppc                2 492 946 942       -----     +2.673%
ppc64              2 464 702 581       -----     +2.488%
ppc64le            2 445 265 571       -----     +2.506%
riscv64            1 625 055 256       -----     +3.953%
s390x              4 194 600 978       -----     +6.623%
sh4                2 164 152 855       -----     +3.167%
sparc64            4 299 515 429       -----     +4.065%
x86_64             2 940 457 915       -----     +2.649%
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 487 801 179       -----     +1.939%
alpha              1 680 728 314       -----     +2.836%
arm               11 563 209 540       -----     +2.848%
hppa               7 272 817 769       -----     +3.263%
m68k               1 998 815 490       -----     +3.198%
mips               1 656 583 796       -----     +1.958%
mipsel             1 659 455 629       -----     +1.947%
mips64             1 955 549 630       -----     +2.448%
mips64el           1 943 600 503       -----     +2.462%
ppc                2 320 351 950       -----     +2.332%
ppc64              2 552 655 693       -----     +2.742%
ppc64le            2 547 377 274       -----     +2.749%
riscv64            1 520 861 808       -----     +3.159%
s390x              5 497 970 574       -----     +1.078%
sh4                2 323 244 128       -----     +3.411%
sparc64            3 427 100 848       -----      +4.73%
x86_64             1 729 365 479       -----     +2.806%
--------------------------------------------------------


</pre></body></html>

--===============4955798842092476077==--

