Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F5A25E3EC
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Sep 2020 01:03:37 +0200 (CEST)
Received: from localhost ([::1]:59104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEKk3-0003OB-P4
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 19:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kEKjL-0002xP-BL
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 19:02:51 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:35001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kEKjJ-0003TR-Ew
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 19:02:50 -0400
Received: by mail-ej1-x635.google.com with SMTP id a26so10647735ejc.2
 for <qemu-devel@nongnu.org>; Fri, 04 Sep 2020 16:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=R6KYpwh8CVfHbMNKEsqUFyDcOPISJ2Hmrym5iSD59kA=;
 b=USGVKhn3MYbRwlllUHuLgYxznwhHAJQ4AqnWIMHYUCfkDRLmE/lhRUyd1J3RIGvCL0
 NE8/mXQKmDWj/mb7bEw771zeb3joY7U/1Gft5BIhZMXTgBxJU3RbLHlj7CpIjC1NS24u
 yiaiSee5JvQ2bLd/MVMaGGWBAMJeHa/+BqQPQU68eVgrsuHP2wU6d+pSUmPD7IWyxGH0
 LKP7q+AuMHdIDdAmbKrs+rse+WuetawVgttZiQaVoupoi4K0pP+HoiYKnJEdgJqsz0Fy
 wimR34+NLra3kvpziEKVyz1bINTyroyfxPtsHfizRhmKlBKiejEcNu06Keo9Vd98zQj/
 DAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=R6KYpwh8CVfHbMNKEsqUFyDcOPISJ2Hmrym5iSD59kA=;
 b=C5Hk9nzexTfnL9KuJK3gBVjGUhpEx4sUtkurKVZvmLww0AkVOwR0PKY6svriwTuA1L
 TA0W+/B1BDXvaFbr2gCLvr2MjciuL8k3Noy5iwsLPrzZ589/z5vbvqEUjE5N0Da0oX08
 NQr0h2ruApqD4HmMNLRgJjt73uUWRifW1O9tzdXIn+AHyQfeO76IFJh6Hr/np+354ZdW
 I3+HBU2fFGoBs/blg3vR09AMYClAgwFV2PuS9Mw5hN/E3h49mc16heLp/spmxbsW9BfF
 Oadj8JB8tZVPCUuTSyKuqeIaB+AzcT9/cc0maeE4dTNoFbO06ixlBqsrA7HzRWAsoiUn
 6oZQ==
X-Gm-Message-State: AOAM5307qfeZ+LdM2JW8twZ6FBOpcKwUjWqbWHdtQFRwtfzRLkUBOFhb
 +YPQr3FYB56jS75AXFqv9EQI0SkS/7A=
X-Google-Smtp-Source: ABdhPJwFQICnya5nLqSUR2ciKb7b3IlOOfoevFjw7/a/WAQDIUuhH48DdUYTtfBB+UTrfFjaAnd5xg==
X-Received: by 2002:a17:906:6a82:: with SMTP id p2mr9878723ejr.3.1599260566826; 
 Fri, 04 Sep 2020 16:02:46 -0700 (PDT)
Received: from [127.0.1.1] ([41.40.229.139])
 by smtp.gmail.com with ESMTPSA id cz21sm7160483edb.45.2020.09.04.16.02.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 16:02:46 -0700 (PDT)
Message-ID: <5f52c796.1c69fb81.4d0c5.bf98@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============7794899190332422620=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 05 Sep 2020 01:02:43 +0200
Subject: [REPORT] Nightly Performance Tests - Friday, September 4, 2020
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-ej1-x635.google.com
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

--===============7794899190332422620==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-09-04 22:30:01
End Time (UTC)   : 2020-09-04 23:02:43
Execution Time   : 0:32:41.137532

Status           : SUCCESS

Note:
Changes denoted by '-----' are less than 0.01%.

--------------------------------------------------------
            SUMMARY REPORT - COMMIT 1133ce5e
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 158 367 875       -----     +1.694%
alpha              1 914 974 588       -----     +3.525%
arm                8 076 537 577       -----     +2.308%
hppa               4 261 662 168       -----     +3.163%
m68k               2 690 308 642       -----     +7.135%
mips               1 862 063 208       -----     +2.496%
mipsel             2 008 248 016       -----     +2.676%
mips64             1 918 630 831       -----     +2.818%
mips64el           2 051 549 551       -----     +3.025%
ppc                2 480 175 842       -----      +3.11%
ppc64              2 576 710 679       -----     +3.142%
ppc64le            2 558 859 780       -----     +3.173%
riscv64            1 406 726 829       -----     +2.652%
s390x              3 158 144 397       -----     +3.119%
sh4                2 364 478 176       -----     +3.333%
sparc64            3 318 820 841       -----     +3.861%
x86_64             1 775 814 279       -----     +2.157%
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 062 601 310       -----     +1.424%
alpha              3 191 872 263       -----     +3.696%
arm               16 357 308 169       -----     +2.348%
hppa               7 228 377 660       -----     +3.086%
m68k               4 294 075 336       -----     +9.693%
mips               3 051 477 273       -----     +2.429%
mipsel             3 231 556 258       -----      +2.87%
mips64             3 245 819 354       -----     +2.596%
mips64el           3 414 210 464       -----     +3.021%
ppc                4 914 559 526       -----      +4.74%
ppc64              5 098 149 082       -----     +4.565%
ppc64le            5 082 423 403       -----      +4.58%
riscv64            2 192 311 866       -----     +1.956%
s390x              4 584 593 271       -----     +2.898%
sh4                3 949 069 035       -----     +3.465%
sparc64            4 586 226 389       -----     +4.238%
x86_64             2 484 119 875       -----     +1.752%
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 210 216 374       -----     +1.494%
alpha              1 494 141 041       -----     +2.151%
arm                8 263 052 939       -----     +2.667%
hppa               5 207 295 529       -----     +3.046%
m68k               1 725 893 071       -----     +2.529%
mips               1 495 267 687       -----     +1.495%
mipsel             1 497 173 485       -----     +1.481%
mips64             1 715 426 577       -----     +1.894%
mips64el           1 695 203 694       -----     +1.909%
ppc                2 014 602 248       -----     +1.822%
ppc64              2 206 265 317       -----     +2.138%
ppc64le            2 198 007 387       -----     +2.146%
riscv64            1 354 920 226       -----     +2.396%
s390x              2 916 101 653       -----     +1.236%
sh4                1 990 565 618       -----     +2.671%
sparc64            2 874 262 720       -----     +3.831%
x86_64             1 554 012 507       -----     +2.122%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 412 273 280       -----     +0.302%
alpha              3 233 996 524       -----     +7.473%
arm                8 545 311 371       -----      +1.09%
hppa               3 483 506 390       -----     +4.466%
m68k               3 919 126 809       -----    +18.433%
mips               2 344 804 626       -----     +4.092%
mipsel             3 329 929 173       -----     +5.178%
mips64             2 359 036 928       -----     +4.075%
mips64el           3 343 636 715       -----     +5.166%
ppc                3 209 498 484       -----     +3.248%
ppc64              3 287 501 294       -----     +3.173%
ppc64le            3 287 179 194       -----     +3.173%
riscv64            1 221 648 580       -----     +0.281%
s390x              2 874 169 207       -----     +5.826%
sh4                3 543 976 125       -----     +6.417%
sparc64            3 426 217 047       -----     +7.141%
x86_64             1 248 945 597       -----     +0.324%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              598 699 923       -----     +0.589%
alpha                372 445 571       -----     +0.679%
arm                  746 713 209       -----      +1.48%
hppa                 674 249 005       -----     +1.179%
m68k                 410 588 055       -----     +0.923%
mips                 499 732 331       -----     +0.538%
mipsel               499 540 812       -----     +0.505%
mips64               481 541 825       -----     +0.597%
mips64el             465 049 197       -----     +0.617%
ppc                  341 376 667       -----     +0.957%
ppc64                393 793 950       -----     +0.965%
ppc64le              393 986 092       -----     +0.967%
riscv64              351 726 143       -----      +0.79%
s390x                494 453 937       -----     +0.604%
sh4                  402 703 499       -----     +0.908%
sparc64              495 982 732       -----     +1.198%
x86_64               402 959 117       -----     +0.841%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 709 698 329       -----     +2.418%
alpha              1 969 470 497       -----     +3.681%
arm                8 323 174 045       -----     +2.589%
hppa               3 188 295 840       -----       +2.9%
m68k               4 953 963 484       -----    +15.154%
mips               2 123 952 157       -----     +3.057%
mipsel             2 124 254 903       -----      +3.05%
mips64             1 999 038 173       -----     +3.405%
mips64el           1 996 418 727       -----     +3.408%
ppc                2 819 292 960       -----     +5.436%
ppc64              2 768 183 258       -----     +5.512%
ppc64le            2 724 807 733       -----     +5.604%
riscv64            1 638 354 494       -----     +4.022%
s390x              2 519 126 684       -----     +3.364%
sh4                2 595 577 299       -----     +2.995%
sparc64            3 989 015 203       -----     +2.748%
x86_64             2 033 496 000       -----     +3.236%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 193 420 845       -----     +2.917%
alpha              1 521 299 685       -----     +4.193%
arm                3 465 588 099       -----      +2.76%
hppa               2 280 014 184       -----      +3.82%
m68k               1 843 201 861       -----     +3.584%
mips               1 558 062 000       -----     +3.865%
mipsel             1 560 665 452       -----     +3.851%
mips64             1 563 408 458       -----     +4.412%
mips64el           1 542 669 394       -----     +4.474%
ppc                1 728 740 660       -----     +3.667%
ppc64              1 842 441 556       -----     +3.555%
ppc64le            1 791 827 976       -----     +3.661%
riscv64            1 348 911 934       -----     +4.657%
s390x              2 184 092 329       -----      +3.32%
sh4                1 946 525 407       -----     +3.626%
sparc64            3 452 242 813       -----     +2.938%
x86_64             1 813 574 933       -----     +3.538%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 592 218 635       -----     +2.468%
alpha              1 855 839 715       -----     +3.488%
arm                7 347 832 712       -----     +2.684%
hppa               4 758 734 964       -----     +3.542%
m68k               2 376 794 658       -----     +3.566%
mips               2 166 611 510       -----     +2.532%
mipsel             2 163 400 215       -----     +2.529%
mips64             2 029 244 517       -----     +3.117%
mips64el           2 011 620 622       -----     +3.144%
ppc                2 492 964 379       -----     +2.674%
ppc64              2 464 699 931       -----     +2.487%
ppc64le            2 445 259 508       -----     +2.506%
riscv64            1 625 065 759       -----     +3.954%
s390x              4 194 624 252       -----     +6.623%
sh4                2 164 157 095       -----     +3.167%
sparc64            4 299 517 202       -----     +4.065%
x86_64             2 940 035 540       -----     +2.634%
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 487 814 311       -----      +1.94%
alpha              1 680 731 411       -----     +2.836%
arm               11 563 320 075       -----     +2.849%
hppa               7 272 823 772       -----     +3.263%
m68k               1 998 825 862       -----     +3.199%
mips               1 656 598 083       -----     +1.959%
mipsel             1 659 463 835       -----     +1.947%
mips64             1 955 530 816       -----     +2.447%
mips64el           1 943 587 600       -----     +2.462%
ppc                2 320 371 818       -----     +2.333%
ppc64              2 552 651 045       -----     +2.742%
ppc64le            2 547 386 950       -----     +2.749%
riscv64            1 520 875 637       -----      +3.16%
s390x              5 497 993 843       -----     +1.078%
sh4                2 323 251 331       -----     +3.411%
sparc64            3 427 102 623       -----      +4.73%
x86_64             1 729 370 663       -----     +2.806%
--------------------------------------------------------


</pre></body></html>

--===============7794899190332422620==--

