Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 483D125F101
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 01:04:17 +0200 (CEST)
Received: from localhost ([::1]:60882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kF3hn-0007w3-Tr
	for lists+qemu-devel@lfdr.de; Sun, 06 Sep 2020 19:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kF3gz-0007We-OB
 for qemu-devel@nongnu.org; Sun, 06 Sep 2020 19:03:25 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kF3gx-0006c7-LE
 for qemu-devel@nongnu.org; Sun, 06 Sep 2020 19:03:25 -0400
Received: by mail-wm1-x32d.google.com with SMTP id z9so12399055wmk.1
 for <qemu-devel@nongnu.org>; Sun, 06 Sep 2020 16:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=IKmK6Q1Gw5rCj5KGWNMXcOaRbFCRI7NCBI7zM9l6xHI=;
 b=UxJmTAfO9oDyYsxVjI6Tts9yoOUi+byAKJe5Tu4dIWEIpmLAR3PgWBuvh/XTBobXgk
 JQV2JZGWFrfH0WTawLSfSioVmqPAi3hGc4qJ9VGD7KYbIRcTPUrOdIiI/ERW+vSPaXF2
 t8nrQHF4ziQtG5aJplACsWvZ4kJo4EMM6tcLR7RfgosIhBwuA1J07m1CgyAwCpgsD+IM
 NVk51atopNE3qjwPdm/RMVfpDgFFc5aAMY0SLXmfW7bJUOkuxPUW5VUfoBETgQDzSMm0
 9BmDx/iAdXC1mhrpNUb8og6FpGM0RcGnFTUdgZIm4BgLS8myLYRg16kXqi7TXlfiKHw9
 22YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=IKmK6Q1Gw5rCj5KGWNMXcOaRbFCRI7NCBI7zM9l6xHI=;
 b=IiCzeNzHEET3wIX5uc4kK2hIPYdsKtABvXoWI3t5agDn3VOccL6REKpsayT1nZAua6
 QIyGVhAL/x6d0ATFutcBMOItNkxahaDaKfQXOMusgcgqdvfd1zEDoZnKB+6gA9iFSAAr
 122Lfp7HZ+DM15TKacdW7wNZpKs8WF2VbGz3bgDMdDCV5xygkwiVIWVEpMFXSY/PpeWl
 4T/f+gT6R66sil2KBQmX9Y9coXc8mB8y0Yarxv6q8Yv1/hP4VNQvVpSiwqaS8eJnTPyw
 1JSsEmAskkGLvkWMXNUg4cOUlakNc4izu915fpTJN6SnnDB36r5VAHewKBEFwYNE2/lC
 kEbA==
X-Gm-Message-State: AOAM530AHqXWXfVVVfHTSNkQdDtL3zVHcFDRBBZ1PcJJg8F8pi5XFWdp
 2iK+DcwmlH9rWu1Abxzhrw869fuVXWzDlw==
X-Google-Smtp-Source: ABdhPJyPt8G4G1ecgN5txRf7YAXcG2FMIs1qQ9bUzefLdePGzMjQiWsCGoQdB5aO9BFjHQiRpzWIDQ==
X-Received: by 2002:a1c:a9c2:: with SMTP id
 s185mr18406745wme.100.1599433401070; 
 Sun, 06 Sep 2020 16:03:21 -0700 (PDT)
Received: from [127.0.1.1] ([197.58.253.73])
 by smtp.gmail.com with ESMTPSA id o129sm22929667wmb.27.2020.09.06.16.03.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2020 16:03:20 -0700 (PDT)
Message-ID: <5f556ab8.1c69fb81.baff.7179@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============7469085488021436407=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 07 Sep 2020 01:03:15 +0200
Subject: [REPORT] Nightly Performance Tests - Sunday, September 6, 2020
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-wm1-x32d.google.com
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

--===============7469085488021436407==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-09-06 22:30:01
End Time (UTC)   : 2020-09-06 23:03:15
Execution Time   : 0:33:13.596113

Status           : SUCCESS

Note:
Changes denoted by '-----' are less than 0.01%.

--------------------------------------------------------
            SUMMARY REPORT - COMMIT 7c37270b
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 158 368 938       -----     +1.694%
alpha              1 914 974 770       -----     +3.525%
arm                8 076 533 928       -----     +2.308%
hppa               4 261 662 205       -----     +3.163%
m68k               2 690 304 604       -----     +7.135%
mips               1 862 052 805       -----     +2.495%
mipsel             2 008 238 496       -----     +2.676%
mips64             1 918 641 080       -----     +2.818%
mips64el           2 051 560 694       -----     +3.026%
ppc                2 480 167 504       -----     +3.109%
ppc64              2 576 714 539       -----     +3.143%
ppc64le            2 558 857 542       -----     +3.173%
riscv64            1 406 726 161       -----     +2.652%
s390x              3 158 150 495       -----     +3.119%
sh4                2 364 464 886       -----     +3.331%
sparc64            3 318 827 014       -----     +3.861%
x86_64             1 775 819 330       -----     +2.157%
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 062 603 221       -----     +1.424%
alpha              3 191 870 253       -----     +3.696%
arm               16 357 297 762       -----     +2.348%
hppa               7 228 377 811       -----     +3.086%
m68k               4 294 069 988       -----     +9.693%
mips               3 051 466 603       -----     +2.428%
mipsel             3 231 546 446       -----      +2.87%
mips64             3 245 832 942       -----     +2.596%
mips64el           3 414 222 197       -----     +3.021%
ppc                4 914 551 625       -----      +4.74%
ppc64              5 098 153 168       -----     +4.565%
ppc64le            5 082 421 772       -----      +4.58%
riscv64            2 192 309 680       -----     +1.956%
s390x              4 584 599 723       -----     +2.898%
sh4                3 949 056 427       -----     +3.464%
sparc64            4 586 233 308       -----     +4.238%
x86_64             2 484 125 760       -----     +1.752%
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 210 214 520       -----     +1.494%
alpha              1 494 138 832       -----     +2.151%
arm                8 263 050 249       -----     +2.667%
hppa               5 207 295 533       -----     +3.046%
m68k               1 725 891 138       -----     +2.529%
mips               1 495 259 637       -----     +1.494%
mipsel             1 497 166 282       -----      +1.48%
mips64             1 715 436 791       -----     +1.894%
mips64el           1 695 217 041       -----     +1.909%
ppc                2 014 591 618       -----     +1.821%
ppc64              2 206 271 717       -----     +2.139%
ppc64le            2 198 003 699       -----     +2.146%
riscv64            1 354 920 580       -----     +2.396%
s390x              2 916 104 932       -----     +1.236%
sh4                1 990 549 868       -----      +2.67%
sparc64            2 874 269 567       -----     +3.831%
x86_64             1 554 016 064       -----     +2.122%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 412 274 274       -----     +0.302%
alpha              3 233 999 758       -----     +7.473%
arm                8 545 308 683       -----      +1.09%
hppa               3 483 506 445       -----     +4.466%
m68k               3 919 121 861       -----    +18.433%
mips               2 344 796 448       -----     +4.092%
mipsel             3 329 919 320       -----     +5.178%
mips64             2 359 046 997       -----     +4.076%
mips64el           3 343 644 823       -----     +5.166%
ppc                3 209 490 458       -----     +3.247%
ppc64              3 287 505 553       -----     +3.173%
ppc64le            3 287 178 278       -----     +3.173%
riscv64            1 221 646 064       -----      +0.28%
s390x              2 874 175 341       -----     +5.826%
sh4                3 543 963 469       -----     +6.416%
sparc64            3 426 223 736       -----     +7.142%
x86_64             1 248 951 562       -----     +0.325%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              598 700 625       -----     +0.589%
alpha                372 445 948       -----     +0.679%
arm                  746 710 547       -----      +1.48%
hppa                 674 251 590       -----     +1.179%
m68k                 410 583 717       -----     +0.922%
mips                 499 721 619       -----     +0.536%
mipsel               499 530 976       -----     +0.503%
mips64               481 554 810       -----     +0.599%
mips64el             465 059 866       -----      +0.62%
ppc                  341 368 642       -----     +0.954%
ppc64                393 797 923       -----     +0.966%
ppc64le              393 985 017       -----     +0.966%
riscv64              351 726 422       -----      +0.79%
s390x                494 462 390       -----     +0.606%
sh4                  402 688 322       -----     +0.904%
sparc64              495 987 016       -----     +1.199%
x86_64               402 965 356       -----     +0.842%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 709 702 219       -----     +2.418%
alpha              1 969 470 895       -----     +3.681%
arm                8 323 171 360       -----     +2.589%
hppa               3 188 295 876       -----       +2.9%
m68k               4 953 958 604       -----    +15.153%
mips               2 123 941 367       -----     +3.057%
mipsel             2 124 245 107       -----     +3.049%
mips64             1 999 048 021       -----     +3.405%
mips64el           1 996 429 400       -----     +3.409%
ppc                2 819 284 975       -----     +5.435%
ppc64              2 768 187 069       -----     +5.513%
ppc64le            2 724 806 155       -----     +5.603%
riscv64            1 638 355 115       -----     +4.022%
s390x              2 519 133 084       -----     +3.365%
sh4                2 595 564 695       -----     +2.995%
sparc64            3 989 021 980       -----     +2.748%
x86_64             2 033 501 871       -----     +3.236%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 193 421 924       -----     +2.917%
alpha              1 521 299 998       -----     +4.193%
arm                3 465 585 448       -----      +2.76%
hppa               2 280 014 146       -----      +3.82%
m68k               1 843 197 387       -----     +3.584%
mips               1 558 051 240       -----     +3.864%
mipsel             1 560 655 646       -----     +3.851%
mips64             1 563 418 635       -----     +4.412%
mips64el           1 542 680 042       -----     +4.474%
ppc                1 728 735 267       -----     +3.667%
ppc64              1 842 445 522       -----     +3.555%
ppc64le            1 791 823 947       -----     +3.661%
riscv64            1 348 912 444       -----     +4.657%
s390x              2 184 098 353       -----      +3.32%
sh4                1 946 512 949       -----     +3.625%
sparc64            3 452 249 646       -----     +2.938%
x86_64             1 813 581 062       -----     +3.539%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 592 219 569       -----     +2.468%
alpha              1 855 843 297       -----     +3.488%
arm                7 347 830 007       -----     +2.684%
hppa               4 758 734 982       -----     +3.542%
m68k               2 376 792 519       -----     +3.566%
mips               2 166 600 786       -----     +2.532%
mipsel             2 163 390 335       -----     +2.528%
mips64             2 029 252 000       -----     +3.117%
mips64el           2 011 631 264       -----     +3.145%
ppc                2 492 953 686       -----     +2.673%
ppc64              2 464 701 125       -----     +2.488%
ppc64le            2 445 255 739       -----     +2.505%
riscv64            1 625 066 222       -----     +3.954%
s390x              4 194 630 214       -----     +6.623%
sh4                2 164 144 617       -----     +3.167%
sparc64            4 299 524 010       -----     +4.065%
x86_64             2 940 038 902       -----     +2.634%
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 487 815 157       -----      +1.94%
alpha              1 680 729 183       -----     +2.836%
arm               11 563 317 375       -----     +2.849%
hppa               7 272 821 259       -----     +3.263%
m68k               1 998 821 622       -----     +3.199%
mips               1 656 584 745       -----     +1.959%
mipsel             1 659 453 862       -----     +1.947%
mips64             1 955 538 446       -----     +2.447%
mips64el           1 943 600 919       -----     +2.462%
ppc                2 320 363 761       -----     +2.333%
ppc64              2 552 654 240       -----     +2.742%
ppc64le            2 547 385 736       -----     +2.749%
riscv64            1 520 872 764       -----     +3.159%
s390x              5 497 999 928       -----     +1.078%
sh4                2 323 238 748       -----      +3.41%
sparc64            3 427 106 852       -----      +4.73%
x86_64             1 729 374 069       -----     +2.807%
--------------------------------------------------------


</pre></body></html>

--===============7469085488021436407==--

