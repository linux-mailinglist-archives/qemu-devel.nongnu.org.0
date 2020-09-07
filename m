Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32131260717
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 01:03:26 +0200 (CEST)
Received: from localhost ([::1]:52730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFQAW-0000he-OA
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 19:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kFQ9o-0000FR-JR
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 19:02:40 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kFQ9m-00051E-JS
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 19:02:40 -0400
Received: by mail-wr1-x435.google.com with SMTP id a17so17125022wrn.6
 for <qemu-devel@nongnu.org>; Mon, 07 Sep 2020 16:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=eAaWfWMvahp+7+lJ4K0MQot7D+S14lBzTYCfor6Jtuc=;
 b=hWk5HGHToTK0KczIldK5NrME0u2mSo30b/AQjbHmOePM6Dq+vPBm7am2JMu7yEB5JI
 kJAVgB7X0VANb1HZkfFUElv127i4VMJ0lU9U7n1XdGzwaVr3Y0of0iwwh+0UzwiPxMkV
 pV4Y7v7NEfX8GF53sHU9jNNODm1Le7EYEkyEm7o5ed9BtuQj7uXacgw8YiLKBx3ZCpRo
 B1AdoLwIevoajgr462KJw9WGLZjWBpvH0TRirv9pYt/kFRRLlQnTwOpQ0M9XhDzoY2OD
 L45rUdundZj7MXuJCzXkh6MqC8y+ruLAmOx3Cio1ve2dHa411KSAiq+n2q1g2M1Zceb+
 IL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=eAaWfWMvahp+7+lJ4K0MQot7D+S14lBzTYCfor6Jtuc=;
 b=FHM+JB2+79QQxl+yXXQPASuLhQZ4kiyA6tCoJJBjna3MIHwMypRutxFUSluGeF64w/
 D+K/OswO8gB/DsAEYHF67yNVPGhZim4PLkWqGh4/Q/k2GB4vn2mUPo3PeaFhdovjW0wS
 7cvamOK129d+oW1ohJzTDdvbcxBni0OSLaNVJvvgn79+DrT0tFYRwkKAc6RVv0V9rymK
 22XghVtMdz8Xf4Dw9iCSBKAhC/lW/GlPycFx8+oWP7A8i0jCrkUwjiuL8fEhhz1L/1fr
 i4mxY4KLBze0A82SGIu6+PQIiQgZAqUWMtXo6rwjqHS10eDamZYkkhZY433CetVhtBJu
 74Tg==
X-Gm-Message-State: AOAM532rClAnGjrksKHdRzsL68Ka1EjRFmmvsI+2DQejxCvO6ufcYCgJ
 d6fRmDERrXJk3J0RHMH9nFm/umEK5KG0tw==
X-Google-Smtp-Source: ABdhPJyvNHAdXIWc+m49w3dv0fPtDdFaQTtTzgyJhB4YbNXyxqcJuUROj3tjf15pCfKQB6I28oJAPg==
X-Received: by 2002:adf:df05:: with SMTP id y5mr25625056wrl.39.1599519756348; 
 Mon, 07 Sep 2020 16:02:36 -0700 (PDT)
Received: from [127.0.1.1] ([102.46.34.193])
 by smtp.gmail.com with ESMTPSA id z15sm30401142wrv.94.2020.09.07.16.02.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 16:02:35 -0700 (PDT)
Message-ID: <5f56bc0b.1c69fb81.1af86.c01f@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============9069312668133021054=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 08 Sep 2020 01:02:34 +0200
Subject: [REPORT] Nightly Performance Tests - Monday, September 7, 2020
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

--===============9069312668133021054==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-09-07 22:30:02
End Time (UTC)   : 2020-09-07 23:02:34
Execution Time   : 0:32:31.848707

Status           : SUCCESS

Note:
Changes denoted by '-----' are less than 0.01%.

--------------------------------------------------------
            SUMMARY REPORT - COMMIT e11bd71f
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 158 376 909       -----     +1.694%
alpha              1 914 987 215       -----     +3.526%
arm                8 076 559 412       -----     +2.309%
hppa               4 261 667 542       -----     +3.163%
m68k               2 690 305 241       -----     +7.135%
mips               1 862 066 070       -----     +2.496%
mipsel             2 008 237 631       -----     +2.676%
mips64             1 918 633 887       -----     +2.818%
mips64el           2 051 563 013       -----     +3.026%
ppc                2 480 186 076       -----      +3.11%
ppc64              2 576 712 418       -----     +3.143%
ppc64le            2 558 867 616       -----     +3.174%
riscv64            1 406 730 247       -----     +2.652%
s390x              3 158 142 650       -----     +3.119%
sh4                2 364 490 038       -----     +3.333%
sparc64            3 318 815 234       -----     +3.861%
x86_64             1 775 821 957       -----     +2.157%
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 062 610 271       -----     +1.425%
alpha              3 191 884 386       -----     +3.697%
arm               16 357 323 255       -----     +2.348%
hppa               7 228 383 429       -----     +3.086%
m68k               4 294 071 402       -----     +9.693%
mips               3 051 478 106       -----     +2.429%
mipsel             3 231 545 860       -----      +2.87%
mips64             3 245 823 176       -----     +2.596%
mips64el           3 414 224 497       -----     +3.021%
ppc                4 914 571 558       -----     +4.741%
ppc64              5 098 150 107       -----     +4.565%
ppc64le            5 082 428 296       -----      +4.58%
riscv64            2 192 315 793       -----     +1.956%
s390x              4 584 591 383       -----     +2.898%
sh4                3 949 081 784       -----     +3.465%
sparc64            4 586 221 241       -----     +4.238%
x86_64             2 484 126 935       -----     +1.752%
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 210 225 365       -----     +1.495%
alpha              1 494 152 973       -----     +2.152%
arm                8 263 076 066       -----     +2.667%
hppa               5 207 301 102       -----     +3.046%
m68k               1 725 889 780       -----     +2.529%
mips               1 495 270 793       -----     +1.495%
mipsel             1 497 165 711       -----      +1.48%
mips64             1 715 427 272       -----     +1.894%
mips64el           1 695 219 297       -----      +1.91%
ppc                2 014 612 375       -----     +1.822%
ppc64              2 206 269 047       -----     +2.139%
ppc64le            2 198 015 652       -----     +2.147%
riscv64            1 354 926 118       -----     +2.397%
s390x              2 916 099 522       -----     +1.236%
sh4                1 990 577 118       -----     +2.672%
sparc64            2 874 256 944       -----     +3.831%
x86_64             1 554 019 603       -----     +2.122%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 412 282 569       -----     +0.302%
alpha              3 234 011 219       -----     +7.474%
arm                8 545 334 711       -----      +1.09%
hppa               3 483 512 094       -----     +4.466%
m68k               3 919 123 098       -----    +18.433%
mips               2 344 810 281       -----     +4.092%
mipsel             3 329 918 767       -----     +5.178%
mips64             2 359 040 228       -----     +4.076%
mips64el           3 343 649 717       -----     +5.166%
ppc                3 209 508 557       -----     +3.248%
ppc64              3 287 502 625       -----     +3.173%
ppc64le            3 287 187 579       -----     +3.173%
riscv64            1 221 648 961       -----     +0.281%
s390x              2 874 167 080       -----     +5.826%
sh4                3 543 988 473       -----     +6.417%
sparc64            3 426 211 323       -----     +7.141%
x86_64             1 248 955 123       -----     +0.325%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              598 709 111       -----      +0.59%
alpha                372 460 161       -----     +0.683%
arm                  746 733 432       -----     +1.483%
hppa                 674 254 606       -----      +1.18%
m68k                 410 582 437       -----     +0.922%
mips                 499 735 189       -----     +0.538%
mipsel               499 530 478       -----     +0.503%
mips64               481 547 261       -----     +0.598%
mips64el             465 062 178       -----      +0.62%
ppc                  341 385 624       -----     +0.959%
ppc64                393 795 233       -----     +0.965%
ppc64le              393 991 577       -----     +0.968%
riscv64              351 729 050       -----      +0.79%
s390x                494 454 428       -----     +0.605%
sh4                  402 715 426       -----     +0.911%
sparc64              495 977 081       -----     +1.197%
x86_64               402 968 780       -----     +0.843%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 709 707 073       -----     +2.418%
alpha              1 969 482 464       -----     +3.682%
arm                8 323 197 297       -----      +2.59%
hppa               3 188 298 880       -----       +2.9%
m68k               4 953 959 851       -----    +15.153%
mips               2 123 955 660       -----     +3.057%
mipsel             2 124 241 908       -----     +3.049%
mips64             1 999 042 023       -----     +3.405%
mips64el           1 996 429 186       -----     +3.409%
ppc                2 819 305 010       -----     +5.436%
ppc64              2 768 184 080       -----     +5.513%
ppc64le            2 724 818 496       -----     +5.604%
riscv64            1 638 358 705       -----     +4.023%
s390x              2 519 124 609       -----     +3.364%
sh4                2 595 589 966       -----     +2.996%
sparc64            3 989 009 601       -----     +2.748%
x86_64             2 033 503 143       -----     +3.236%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 193 429 897       -----     +2.917%
alpha              1 521 311 547       -----     +4.194%
arm                3 465 611 245       -----     +2.761%
hppa               2 280 019 743       -----      +3.82%
m68k               1 843 195 993       -----     +3.584%
mips               1 558 065 235       -----     +3.865%
mipsel             1 560 655 117       -----     +3.851%
mips64             1 563 411 799       -----     +4.412%
mips64el           1 542 682 411       -----     +4.474%
ppc                1 728 751 280       -----     +3.668%
ppc64              1 842 442 922       -----     +3.555%
ppc64le            1 791 836 334       -----     +3.662%
riscv64            1 348 915 604       -----     +4.657%
s390x              2 184 090 336       -----      +3.32%
sh4                1 946 537 611       -----     +3.626%
sparc64            3 452 237 238       -----     +2.938%
x86_64             1 813 581 963       -----     +3.539%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 592 227 670       -----     +2.468%
alpha              1 855 851 684       -----     +3.488%
arm                7 347 855 824       -----     +2.684%
hppa               4 758 740 523       -----     +3.542%
m68k               2 376 793 841       -----     +3.566%
mips               2 166 612 218       -----     +2.532%
mipsel             2 163 389 834       -----     +2.528%
mips64             2 029 245 328       -----     +3.117%
mips64el           2 011 633 597       -----     +3.145%
ppc                2 492 975 041       -----     +2.674%
ppc64              2 464 700 877       -----     +2.488%
ppc64le            2 445 267 770       -----     +2.506%
riscv64            1 625 069 371       -----     +3.954%
s390x              4 194 622 121       -----     +6.623%
sh4                2 164 166 717       -----     +3.168%
sparc64            4 299 511 690       -----     +4.065%
x86_64             2 940 042 540       -----     +2.634%
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 487 823 323       -----      +1.94%
alpha              1 680 743 288       -----     +2.837%
arm               11 563 343 467       -----      +2.85%
hppa               7 272 829 963       -----     +3.263%
m68k               1 998 825 528       -----     +3.199%
mips               1 656 601 082       -----      +1.96%
mipsel             1 659 453 373       -----     +1.947%
mips64             1 955 534 011       -----     +2.447%
mips64el           1 943 603 224       -----     +2.462%
ppc                2 320 379 164       -----     +2.333%
ppc64              2 552 654 453       -----     +2.742%
ppc64le            2 547 395 230       -----     +2.749%
riscv64            1 520 878 374       -----      +3.16%
s390x              5 497 991 722       -----     +1.078%
sh4                2 323 263 215       -----     +3.412%
sparc64            3 427 096 760       -----      +4.73%
x86_64             1 729 377 571       -----     +2.807%
--------------------------------------------------------


</pre></body></html>

--===============9069312668133021054==--

