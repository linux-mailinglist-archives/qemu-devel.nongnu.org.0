Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4869225A1C9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 01:03:58 +0200 (CEST)
Received: from localhost ([::1]:45532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDFJk-0001bH-QO
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 19:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kDFIw-0001Az-5q
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 19:03:06 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:52734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kDFIq-0005Nt-7z
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 19:03:05 -0400
Received: by mail-wm1-x333.google.com with SMTP id q9so2637466wmj.2
 for <qemu-devel@nongnu.org>; Tue, 01 Sep 2020 16:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=SHV6GUYqimQItxw/Dri73yx6aVBp+GJl9w6Bv/WzWC4=;
 b=u0gTkCwRIC2D/rEXfJoPO2GIyx0b9a3r3lSdZeDrQE5N9lK8JoLIXy42CY5NZfHCqo
 p7KTWmaoEPmV3+ndIamI1RQ8zgJqW3/wPkYhUDvFhKhS3qar1LBRjlVcuVrhjDTS5J9/
 8ORUqShgDOx+JHnnaLXkCV363SyaRtJeMAPItKEV9BlRAIVFeb5uXIkV5vXRKOsMNVg/
 h2jXUbVBC9zyEBhjaR2gCVKx0oBnRniROLe++cEwJ3JBeUahcei9aNz5CNyGO0JIh7GQ
 OBLLI1+pld4zr8nIy8yw8W1mddQGEf88oBVig/rYSWL3c2R1//MOfSwgigHTqYJLlym9
 x5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=SHV6GUYqimQItxw/Dri73yx6aVBp+GJl9w6Bv/WzWC4=;
 b=A3WrySKPHtKMw4K0Wt73xO2VMdCQohPnlqK8Zi4D/7GKmHTOqx4DiyQ4DXvq55oR43
 3OCMD1nE3bLY2wXZhNn4V5YGJYOnOtv1qA0qBAqsLxl3Abkf60OM3DA15SRLcAdSjs4y
 lhLrYYakinBSJC5//8PQOfCX5W1xnTNRpbKA8sx7LjXWf0qy4fMlYiBsToaOYCc2Is2p
 Lc5yOStaehyTycreVYxjT48Guc0+emhUksXwBMIinPd2DZzOVYJWsy4dV9Oglw6GSWky
 fnqwfY3InvHYKqbVx06BC792xH4QXInLe7Yi7IIeaA6vNy5iXZsJElYwJrf9r8GwiIcV
 drGA==
X-Gm-Message-State: AOAM5324eKZpxV5JXALqWMQq55Yvtgiyz+Qtmb2ScHSeHdazg/EL8QUI
 TWKHvHSaDlFqTPg5E4wWfKFfYuaRHfY=
X-Google-Smtp-Source: ABdhPJwYQpz25SQLjQeV30nUvGyCdr4+QJPaDgVvu6J+N8IMwedP1gq3uvqN0YAq0HZuS8+ZTuSqpg==
X-Received: by 2002:a1c:a185:: with SMTP id k127mr4030057wme.142.1599001376340; 
 Tue, 01 Sep 2020 16:02:56 -0700 (PDT)
Received: from [127.0.1.1] ([197.58.14.227])
 by smtp.gmail.com with ESMTPSA id k184sm3643485wme.1.2020.09.01.16.02.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 16:02:55 -0700 (PDT)
Message-ID: <5f4ed31f.1c69fb81.eef5a.bf6f@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============8620899110224784868=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 02 Sep 2020 01:02:51 +0200
Subject: [REPORT] Nightly Performance Tests - Tuesday, September 1, 2020
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-wm1-x333.google.com
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

--===============8620899110224784868==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-09-01 22:30:02
End Time (UTC)   : 2020-09-01 23:02:51
Execution Time   : 0:32:49.638129

Status           : SUCCESS

Note:
Changes denoted by '-----' are less than 0.01%.

--------------------------------------------------------
            SUMMARY REPORT - COMMIT 8d90bfc5
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 158 350 999       -----     +1.693%
alpha              1 914 981 010       -----     +3.525%
arm                8 076 531 001       -----     +2.308%
hppa               4 261 662 287       -----     +3.163%
m68k               2 690 302 840       -----     +7.135%
mips               1 862 054 380       -----     +2.495%
mipsel             2 008 241 001       -----     +2.676%
mips64             1 918 633 852       -----     +2.818%
mips64el           2 051 567 365       -----     +3.026%
ppc                2 480 164 517       -----     +3.109%
ppc64              2 576 708 166       -----     +3.142%
ppc64le            2 558 867 362       -----     +3.174%
riscv64            1 406 721 465       -----     +2.651%
s390x              3 158 148 058       -----     +3.119%
sh4                2 364 478 840       -----     +3.333%
sparc64            3 318 819 982       -----     +3.861%
x86_64             1 775 817 408       -----     +2.157%
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 062 583 254       -----     +1.424%
alpha              3 191 875 753       -----     +3.696%
arm               16 357 301 960       -----     +2.348%
hppa               7 228 378 025       -----     +3.086%
m68k               4 294 068 499       -----     +9.693%
mips               3 051 468 311       -----     +2.428%
mipsel             3 231 549 756       -----      +2.87%
mips64             3 245 827 156       -----     +2.596%
mips64el           3 414 230 354       -----     +3.022%
ppc                4 914 550 074       -----      +4.74%
ppc64              5 098 147 947       -----     +4.565%
ppc64le            5 082 418 836       -----      +4.58%
riscv64            2 192 306 931       -----     +1.956%
s390x              4 584 596 667       -----     +2.898%
sh4                3 949 069 729       -----     +3.465%
sparc64            4 586 225 467       -----     +4.238%
x86_64             2 484 124 345       -----     +1.752%
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 210 199 232       -----     +1.494%
alpha              1 494 147 129       -----     +2.151%
arm                8 263 046 429       -----     +2.667%
hppa               5 207 295 544       -----     +3.046%
m68k               1 725 886 990       -----     +2.528%
mips               1 495 261 093       -----     +1.494%
mipsel             1 497 168 507       -----      +1.48%
mips64             1 715 429 703       -----     +1.894%
mips64el           1 695 229 035       -----      +1.91%
ppc                2 014 590 358       -----     +1.821%
ppc64              2 206 264 813       -----     +2.138%
ppc64le            2 198 017 266       -----     +2.147%
riscv64            1 354 917 032       -----     +2.396%
s390x              2 916 104 780       -----     +1.236%
sh4                1 990 565 824       -----     +2.671%
sparc64            2 874 261 717       -----     +3.831%
x86_64             1 554 014 845       -----     +2.122%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 412 256 280       -----       +0.3%
alpha              3 234 002 720       -----     +7.474%
arm                8 545 305 325       -----      +1.09%
hppa               3 483 506 497       -----     +4.466%
m68k               3 919 120 341       -----    +18.433%
mips               2 344 798 117       -----     +4.092%
mipsel             3 329 921 914       -----     +5.178%
mips64             2 359 037 334       -----     +4.075%
mips64el           3 343 652 736       -----     +5.166%
ppc                3 209 486 564       -----     +3.247%
ppc64              3 287 498 098       -----     +3.173%
ppc64le            3 287 188 859       -----     +3.173%
riscv64            1 221 642 452       -----      +0.28%
s390x              2 874 172 518       -----     +5.826%
sh4                3 543 976 810       -----     +6.417%
sparc64            3 426 216 148       -----     +7.141%
x86_64             1 248 950 444       -----     +0.325%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              598 685 511       -----     +0.586%
alpha                372 454 280       -----     +0.681%
arm                  746 704 042     +0.014%     +1.479%
hppa                 674 249 118       -----     +1.179%
m68k                 410 582 785       -----     +0.922%
mips                 499 720 374       -----     +0.535%
mipsel               499 533 155       -----     +0.504%
mips64               481 545 031       -----     +0.597%
mips64el             465 064 506       -----     +0.621%
ppc                  341 362 029       -----     +0.952%
ppc64                393 787 545       -----     +0.964%
ppc64le              393 992 576       -----     +0.968%
riscv64              351 720 561       -----     +0.788%
s390x                494 459 676       -----     +0.606%
sh4                  402 704 215       -----     +0.908%
sparc64              495 981 990       -----     +1.198%
x86_64               402 961 505       -----     +0.841%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 709 683 813       -----     +2.417%
alpha              1 969 476 546       -----     +3.681%
arm                8 323 168 021       -----     +2.589%
hppa               3 188 296 012       -----       +2.9%
m68k               4 953 957 076       -----    +15.153%
mips               2 123 943 136       -----     +3.057%
mipsel             2 124 247 560       -----     +3.049%
mips64             1 999 038 487       -----     +3.405%
mips64el           1 996 433 059       -----     +3.409%
ppc                2 819 283 467       -----     +5.435%
ppc64              2 768 180 707       -----     +5.512%
ppc64le            2 724 819 194       -----     +5.604%
riscv64            1 638 349 718       -----     +4.022%
s390x              2 519 130 148       -----     +3.364%
sh4                2 595 578 101       -----     +2.995%
sparc64            3 989 014 331       -----     +2.748%
x86_64             2 033 500 441       -----     +3.236%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 193 401 154       -----     +2.916%
alpha              1 521 305 722       -----     +4.194%
arm                3 465 582 409       -----      +2.76%
hppa               2 280 014 178       -----      +3.82%
m68k               1 843 195 878       -----     +3.584%
mips               1 558 052 910       -----     +3.864%
mipsel             1 560 658 212       -----     +3.851%
mips64             1 563 411 693       -----     +4.412%
mips64el           1 542 686 339       -----     +4.475%
ppc                1 728 731 416       -----     +3.667%
ppc64              1 842 438 893       -----     +3.555%
ppc64le            1 791 837 077       -----     +3.662%
riscv64            1 348 906 013       -----     +4.657%
s390x              2 184 095 700       -----      +3.32%
sh4                1 946 526 215       -----     +3.626%
sparc64            3 452 242 095       -----     +2.938%
x86_64             1 813 577 234       -----     +3.539%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 592 201 490       -----     +2.467%
alpha              1 855 848 469       -----     +3.488%
arm                7 347 826 305       -----     +2.684%
hppa               4 758 735 014       -----     +3.542%
m68k               2 376 791 024       -----     +3.566%
mips               2 166 602 314       -----     +2.532%
mipsel             2 163 392 855       -----     +2.528%
mips64             2 029 247 583       -----     +3.117%
mips64el           2 011 636 779       -----     +3.145%
ppc                2 492 952 321       -----     +2.673%
ppc64              2 464 696 579       -----     +2.487%
ppc64le            2 445 268 891       -----     +2.506%
riscv64            1 625 059 833       -----     +3.954%
s390x              4 194 627 835       -----     +6.623%
sh4                2 164 157 870       -----     +3.167%
sparc64            4 299 516 447       -----     +4.065%
x86_64             2 940 037 651       -----     +2.634%
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 487 797 262       -----     +1.939%
alpha              1 680 737 463       -----     +2.836%
arm               11 563 313 522       -----     +2.849%
hppa               7 272 823 910       -----     +3.263%
m68k               1 998 820 131       -----     +3.198%
mips               1 656 588 785       -----     +1.959%
mipsel             1 659 456 049       -----     +1.947%
mips64             1 955 533 834       -----     +2.447%
mips64el           1 943 606 112       -----     +2.463%
ppc                2 320 359 914       -----     +2.333%
ppc64              2 552 650 749       -----     +2.742%
ppc64le            2 547 396 197       -----     +2.749%
riscv64            1 520 869 186       -----     +3.159%
s390x              5 497 997 146       -----     +1.078%
sh4                2 323 251 963       -----     +3.411%
sparc64            3 427 101 663       -----      +4.73%
x86_64             1 729 372 801       -----     +2.807%
--------------------------------------------------------


</pre></body></html>

--===============8620899110224784868==--

