Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5D725EBAA
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Sep 2020 01:03:45 +0200 (CEST)
Received: from localhost ([::1]:44922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEhDk-0002Mo-EV
	for lists+qemu-devel@lfdr.de; Sat, 05 Sep 2020 19:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kEhD2-0001wA-DN
 for qemu-devel@nongnu.org; Sat, 05 Sep 2020 19:03:00 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:39974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kEhD0-00018o-MZ
 for qemu-devel@nongnu.org; Sat, 05 Sep 2020 19:03:00 -0400
Received: by mail-ed1-x52a.google.com with SMTP id t16so4480790edw.7
 for <qemu-devel@nongnu.org>; Sat, 05 Sep 2020 16:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=cvilBd8VYQUL7gbt7PVZW3Y0otBQMVktw+Pa8U4iY7s=;
 b=iOByLPLhLrKYQf3WZ1yOdJ/ZB8g0K4QtDw3BTFQ3+0NzDPSAsAH6d+aKOOj8m+1/LA
 tosyiK4Z2a5AhSAh0No4uMhioMXC+eU8eDJLrlC5K69P0yorDSI4YYDgpPi5eMbe4Sg9
 xWO0/TqifgYyozlbjYl74l8CoHxO6sRt7uFHXgYa8abkOQ543QCZjRO59Y+L/JwkWivY
 2fhmw7DXX8r3Uk4R0rrvlWwCnRRieY5mzkTwJDNyh/0ZVqdqKMApWnPnmUL8mmKVOqLP
 Jljw4XTzAbcDnugM5nd7bV+M6gZKVnjLChujsYv87IGmUPo7nYuCBQAzfj3vXd/IJKQi
 /NDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=cvilBd8VYQUL7gbt7PVZW3Y0otBQMVktw+Pa8U4iY7s=;
 b=Mj4B8lx/bgZVpqHDZdAjA6fZCLCdE2r75s7+aWKZMkatJ5DgUqT6ID6vk7p/+wK10c
 XRHtax9FNVkdhN3Joxqx2j7dlGZMvB69ahgq23guh0VaZTqq6MFCrLFogPNs67iCy5r0
 uLXKSRFEHbE3aoFpI5WmuKppHlyzOVvBhANbvjPHW/TDAsFcTj3BHFzulpOzFD1XeQLf
 /PRSnWPwZMr8kVH/oomN1IM7Wp4v11v96LNGgdfwln3PGjbJErGiR2XP5xHN/FTR0Jqw
 b63kiM80M8sbpUbIGQg+wJ9jj3FX8J3qyq5tbMKpt3z7tGe6sFuEgfsad6PNdjb/yD1A
 WA8w==
X-Gm-Message-State: AOAM531YThyU4NyL1+xDud3FAWYJ2Br8ivoOP68zyX9EpmWS3FSDLDYo
 UzqsJlY6Ej62TqDoBvkDLlstsg6Ftm8=
X-Google-Smtp-Source: ABdhPJxRXd0LKsydLR3UfVhUuw5+lbews+KXyRzwadz8Uq3VCSVMovSOLgYv48eXP06GH+EN8UdKFA==
X-Received: by 2002:a50:ce06:: with SMTP id y6mr14377169edi.273.1599346976176; 
 Sat, 05 Sep 2020 16:02:56 -0700 (PDT)
Received: from [127.0.1.1] ([41.40.229.139])
 by smtp.gmail.com with ESMTPSA id k6sm9210324edj.93.2020.09.05.16.02.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 16:02:55 -0700 (PDT)
Message-ID: <5f54191f.1c69fb81.a80ae.f24e@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============4466605071867739520=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 06 Sep 2020 01:02:41 +0200
Subject: [REPORT] Nightly Performance Tests - Saturday, September 5, 2020
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-ed1-x52a.google.com
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

--===============4466605071867739520==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-09-05 22:30:02
End Time (UTC)   : 2020-09-05 23:02:41
Execution Time   : 0:32:38.859046

Status           : SUCCESS

Note:
Changes denoted by '-----' are less than 0.01%.

--------------------------------------------------------
            SUMMARY REPORT - COMMIT 8ca019b9
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 158 372 846       -----     +1.694%
alpha              1 914 985 445       -----     +3.526%
arm                8 076 535 242       -----     +2.308%
hppa               4 261 669 730       -----     +3.163%
m68k               2 690 289 243       -----     +7.134%
mips               1 862 064 257       -----     +2.496%
mipsel             2 008 246 117       -----     +2.676%
mips64             1 918 642 593       -----     +2.819%
mips64el           2 051 561 403       -----     +3.026%
ppc                2 480 179 159       -----      +3.11%
ppc64              2 576 714 747       -----     +3.143%
ppc64le            2 558 860 504       -----     +3.173%
riscv64            1 406 723 320       -----     +2.652%
s390x              3 158 151 520       -----     +3.119%
sh4                2 364 479 204       -----     +3.333%
sparc64            3 318 821 622       -----     +3.861%
x86_64             1 775 829 866       -----     +2.158%
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 062 604 661       -----     +1.424%
alpha              3 191 883 440       -----     +3.697%
arm               16 357 299 371       -----     +2.348%
hppa               7 228 385 164       -----     +3.086%
m68k               4 294 054 921       -----     +9.693%
mips               3 051 478 321       -----     +2.429%
mipsel             3 231 555 078       -----      +2.87%
mips64             3 245 831 513       -----     +2.596%
mips64el           3 414 222 653       -----     +3.021%
ppc                4 914 563 597       -----     +4.741%
ppc64              5 098 153 685       -----     +4.565%
ppc64le            5 082 423 743       -----      +4.58%
riscv64            2 192 306 122       -----     +1.956%
s390x              4 584 600 496       -----     +2.898%
sh4                3 949 070 779       -----     +3.465%
sparc64            4 586 228 003       -----     +4.238%
x86_64             2 484 133 478       -----     +1.752%
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 210 218 962       -----     +1.495%
alpha              1 494 152 165       -----     +2.152%
arm                8 263 051 865       -----     +2.667%
hppa               5 207 303 004       -----     +3.047%
m68k               1 725 875 771       -----     +2.528%
mips               1 495 271 435       -----     +1.495%
mipsel             1 497 172 181       -----     +1.481%
mips64             1 715 437 823       -----     +1.895%
mips64el           1 695 217 319       -----     +1.909%
ppc                2 014 602 742       -----     +1.822%
ppc64              2 206 269 157       -----     +2.139%
ppc64le            2 198 007 802       -----     +2.147%
riscv64            1 354 920 272       -----     +2.396%
s390x              2 916 108 759       -----     +1.236%
sh4                1 990 564 182       -----     +2.671%
sparc64            2 874 264 153       -----     +3.831%
x86_64             1 554 026 228       -----     +2.123%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 412 278 646       -----     +0.302%
alpha              3 234 009 994       -----     +7.474%
arm                8 545 310 309       -----      +1.09%
hppa               3 483 513 896       -----     +4.466%
m68k               3 919 106 424       -----    +18.432%
mips               2 344 808 256       -----     +4.092%
mipsel             3 329 928 020       -----     +5.178%
mips64             2 359 048 149       -----     +4.076%
mips64el           3 343 647 858       -----     +5.166%
ppc                3 209 501 464       -----     +3.248%
ppc64              3 287 505 670       -----     +3.173%
ppc64le            3 287 179 873       -----     +3.173%
riscv64            1 221 642 978       -----      +0.28%
s390x              2 874 176 367       -----     +5.826%
sh4                3 543 977 770       -----     +6.417%
sparc64            3 426 215 728       -----     +7.141%
x86_64             1 248 964 325       -----     +0.326%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              598 705 234       -----     +0.589%
alpha                372 455 917       -----     +0.682%
arm                  746 709 569       -----      +1.48%
hppa                 674 259 158       -----      +1.18%
m68k                 410 565 716       -----     +0.918%
mips                 499 730 751       -----     +0.537%
mipsel               499 536 946       -----     +0.504%
mips64               481 555 707       -----     +0.599%
mips64el             465 060 214       -----      +0.62%
ppc                  341 379 090       -----     +0.957%
ppc64                393 797 888       -----     +0.966%
ppc64le              393 986 243       -----     +0.967%
riscv64              351 723 780       -----     +0.789%
s390x                494 460 984       -----     +0.606%
sh4                  402 702 672       -----     +0.908%
sparc64              495 984 123       -----     +1.198%
x86_64               402 975 427       -----     +0.845%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 709 706 231       -----     +2.418%
alpha              1 969 481 734       -----     +3.682%
arm                8 323 172 933       -----     +2.589%
hppa               3 188 303 306       -----       +2.9%
m68k               4 953 943 219       -----    +15.153%
mips               2 123 953 154       -----     +3.057%
mipsel             2 124 253 613       -----      +3.05%
mips64             1 999 049 313       -----     +3.405%
mips64el           1 996 429 803       -----     +3.409%
ppc                2 819 297 201       -----     +5.436%
ppc64              2 768 187 579       -----     +5.513%
ppc64le            2 724 810 619       -----     +5.604%
riscv64            1 638 351 471       -----     +4.022%
s390x              2 519 133 859       -----     +3.365%
sh4                2 595 579 119       -----     +2.996%
sparc64            3 989 016 522       -----     +2.748%
x86_64             2 033 512 257       -----     +3.237%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 193 428 108       -----     +2.917%
alpha              1 521 307 799       -----     +4.194%
arm                3 465 587 134       -----      +2.76%
hppa               2 280 019 051       -----      +3.82%
m68k               1 843 181 930       -----     +3.583%
mips               1 558 060 436       -----     +3.865%
mipsel             1 560 661 625       -----     +3.851%
mips64             1 563 420 392       -----     +4.413%
mips64el           1 542 680 482       -----     +4.474%
ppc                1 728 746 688       -----     +3.668%
ppc64              1 842 443 171       -----     +3.555%
ppc64le            1 791 828 096       -----     +3.661%
riscv64            1 348 906 575       -----     +4.657%
s390x              2 184 099 413       -----      +3.32%
sh4                1 946 527 203       -----     +3.626%
sparc64            3 452 241 640       -----     +2.938%
x86_64             1 813 591 278       -----     +3.539%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 592 223 950       -----     +2.468%
alpha              1 855 853 304       -----     +3.488%
arm                7 347 831 767       -----     +2.684%
hppa               4 758 742 980       -----     +3.542%
m68k               2 376 777 147       -----     +3.566%
mips               2 166 612 561       -----     +2.532%
mipsel             2 163 398 999       -----     +2.528%
mips64             2 029 255 789       -----     +3.117%
mips64el           2 011 631 647       -----     +3.145%
ppc                2 492 967 709       -----     +2.674%
ppc64              2 464 703 871       -----     +2.488%
ppc64le            2 445 259 827       -----     +2.506%
riscv64            1 625 063 018       -----     +3.954%
s390x              4 194 631 357       -----     +6.623%
sh4                2 164 158 860       -----     +3.167%
sparc64            4 299 518 684       -----     +4.065%
x86_64             2 940 049 186       -----     +2.635%
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 487 816 982       -----      +1.94%
alpha              1 680 739 209       -----     +2.836%
arm               11 563 318 994       -----     +2.849%
hppa               7 272 831 282       -----     +3.263%
m68k               1 998 808 821       -----     +3.198%
mips               1 656 599 146       -----     +1.959%
mipsel             1 659 462 479       -----     +1.947%
mips64             1 955 542 064       -----     +2.448%
mips64el           1 943 601 254       -----     +2.462%
ppc                2 320 374 783       -----     +2.333%
ppc64              2 552 656 958       -----     +2.742%
ppc64le            2 547 387 833       -----     +2.749%
riscv64            1 520 872 349       -----     +3.159%
s390x              5 498 000 932       -----     +1.078%
sh4                2 323 253 047       -----     +3.411%
sparc64            3 427 104 129       -----      +4.73%
x86_64             1 729 386 750       -----     +2.807%
--------------------------------------------------------


</pre></body></html>

--===============4466605071867739520==--

