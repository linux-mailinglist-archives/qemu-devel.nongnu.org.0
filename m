Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E4A2570F8
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 01:03:37 +0200 (CEST)
Received: from localhost ([::1]:38744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCWMJ-0003mT-Uu
	for lists+qemu-devel@lfdr.de; Sun, 30 Aug 2020 19:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kCWLY-00033v-CA
 for qemu-devel@nongnu.org; Sun, 30 Aug 2020 19:02:48 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:50371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kCWLW-0002QA-DW
 for qemu-devel@nongnu.org; Sun, 30 Aug 2020 19:02:47 -0400
Received: by mail-wm1-x32e.google.com with SMTP id e17so3629907wme.0
 for <qemu-devel@nongnu.org>; Sun, 30 Aug 2020 16:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=dAIHXuQtDNh1i7ydp32tFbKTSolQSNClcLKrChjt0YY=;
 b=VMZ4qDgLpaZ5JhAqptrc3wzdalgH9cCxmAFmoCQQ0Iz1/OPYk8VlGKViXssqkhfsKm
 ga/Q1kKECp5pwDQcXuxm/19EyeU+XnMPoGRTgzqjxrRvVeQ6L7YxYLYX6yFoMuRDlT39
 oXofcCIYr7tjw46SMT9BnPW4xvSlyS0Kt1cAo2T4U7woaUbhaqfLYTUxt+/SnMOA9ZCG
 //wfR/zX85M4yY9mX4M4HJini5WAiRCgoAHh7+XwvV/JVR52odiqBIi7NixkPDu16o7h
 a4Mzt9y9tg4Q9uN8Al7XT+w2vEFMoWdKn4iXzVVs1c1xEauDodJrun/mUM9kgYMJ3Zpp
 BsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=dAIHXuQtDNh1i7ydp32tFbKTSolQSNClcLKrChjt0YY=;
 b=du5HqBwr72fKaomaW6kcg5y8Y71Am3q6Lh+oog7Ji8+YLC/XQTe9S6NXDtQTL1RVtp
 3koHLMUenqi3dlRpbDGjOnR41G0ORFqWaJZ6i7JhCi/3nL2e2zrBMIje1NhSdGTHBpfr
 LbsGWwROM3ASVN4ba2fp5n318SJNGxsxnogoNwFnpfCSapR8Dt3vbt8/jj01j/REHt15
 Y4f/qPXRr7neHHxQgD6C19YlzklQtoV+RT7nqLyss7oRfRvv4UMH4B3/5fSp2XgXjFcQ
 xkW+0rsa7mFDHQCa4MS/AoheemxYwx39IRpnh4vvy3T05XQtSOI/CXIILq0A7gyQrthY
 o0FA==
X-Gm-Message-State: AOAM531yLdLqkVHqEY9SLTSbGFrJDkvOduaci7to3ZWhzZhsDNuXmvLi
 U+7lxPTSDmKmwc8T8gh9W0roxVbc3yFRCQ==
X-Google-Smtp-Source: ABdhPJwRK6djKLOXvhCEdBqioIRMAfwwK1wrSmMhBLh8Opqh7guM1F5QHTSnHjsYins7KX5uvbThDA==
X-Received: by 2002:a1c:80cd:: with SMTP id b196mr6106839wmd.104.1598828564107; 
 Sun, 30 Aug 2020 16:02:44 -0700 (PDT)
Received: from [127.0.1.1] ([197.58.77.158])
 by smtp.gmail.com with ESMTPSA id a82sm539344wmc.45.2020.08.30.16.02.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2020 16:02:43 -0700 (PDT)
Message-ID: <5f4c3013.1c69fb81.65595.13f4@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============8223234112466865143=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 31 Aug 2020 01:02:40 +0200
Subject: [REPORT] Nightly Performance Tests - Sunday, August 30, 2020
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-wm1-x32e.google.com
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

--===============8223234112466865143==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-08-30 22:30:02
End Time (UTC)   : 2020-08-30 23:02:40
Execution Time   : 0:32:38.741642

Status           : SUCCESS

Note:
Changes denoted by '-----' are less than 0.01%.

--------------------------------------------------------
            SUMMARY REPORT - COMMIT 39335fab
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 158 356 799       -----     +1.693%
alpha              1 914 979 687       -----     +3.525%
arm                8 076 407 703       -----     +2.305%
hppa               4 261 660 530       -----     +3.163%
m68k               2 690 309 633       -----     +7.135%
mips               1 862 053 953       -----     +2.495%
mipsel             2 008 238 376       -----     +2.676%
mips64             1 918 641 638       -----     +2.818%
mips64el           2 051 571 079       -----     +3.026%
ppc                2 480 161 990       -----     +3.108%
ppc64              2 576 693 226       -----     +3.141%
ppc64le            2 558 854 547       -----     +3.173%
riscv64            1 406 724 446       -----     +2.652%
s390x              3 158 133 785       -----     +3.118%
sh4                2 364 482 941       -----     +3.333%
sparc64            3 318 814 369       -----     +3.861%
x86_64             1 775 816 026       -----     +2.157%
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 062 590 918       -----     +1.424%
alpha              3 191 876 357       -----     +3.696%
arm               16 357 180 254       -----     +2.347%
hppa               7 228 376 861       -----     +3.086%
m68k               4 294 075 069       -----     +9.693%
mips               3 051 468 173       -----     +2.428%
mipsel             3 231 546 500       -----      +2.87%
mips64             3 245 835 893       -----     +2.596%
mips64el           3 414 234 674       -----     +3.022%
ppc                4 914 547 363       -----      +4.74%
ppc64              5 098 133 092       -----     +4.565%
ppc64le            5 082 406 390       -----      +4.58%
riscv64            2 192 311 045       -----     +1.956%
s390x              4 584 582 569       -----     +2.897%
sh4                3 949 075 402       -----     +3.465%
sparc64            4 586 219 976       -----     +4.238%
x86_64             2 484 120 493       -----     +1.752%
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 210 203 163       -----     +1.494%
alpha              1 494 145 105       -----     +2.151%
arm                8 262 925 102       -----     +2.665%
hppa               5 207 291 886       -----     +3.046%
m68k               1 725 893 958       -----     +2.529%
mips               1 495 258 401       -----     +1.494%
mipsel             1 497 166 001       -----      +1.48%
mips64             1 715 435 496       -----     +1.894%
mips64el           1 695 224 300       -----      +1.91%
ppc                2 014 587 884       -----     +1.821%
ppc64              2 206 248 055       -----     +2.138%
ppc64le            2 198 001 759       -----     +2.146%
riscv64            1 354 920 887       -----     +2.396%
s390x              2 916 088 319       -----     +1.236%
sh4                1 990 570 655       -----     +2.671%
sparc64            2 874 255 925       -----     +3.831%
x86_64             1 554 013 871       -----     +2.122%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 412 260 258       -----     +0.301%
alpha              3 234 003 322       -----     +7.474%
arm                8 545 183 605       -----     +1.088%
hppa               3 483 505 358       -----     +4.466%
m68k               3 919 128 393       -----    +18.433%
mips               2 344 797 921       -----     +4.092%
mipsel             3 329 919 088       -----     +5.178%
mips64             2 359 048 388       -----     +4.076%
mips64el           3 343 657 549       -----     +5.166%
ppc                3 209 483 961       -----     +3.247%
ppc64              3 287 484 371       -----     +3.173%
ppc64le            3 287 176 314       -----     +3.173%
riscv64            1 221 646 463       -----      +0.28%
s390x              2 874 158 528       -----     +5.826%
sh4                3 543 982 151       -----     +6.417%
sparc64            3 426 210 437       -----     +7.141%
x86_64             1 248 949 368       -----     +0.325%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              598 692 037       -----     +0.587%
alpha                372 452 369       -----     +0.681%
arm                  746 585 340       -----     +1.463%
hppa                 674 247 984       -----     +1.179%
m68k                 410 586 046       -----     +0.923%
mips                 499 722 925       -----     +0.536%
mipsel               499 530 824       -----     +0.503%
mips64               481 555 926       -----       +0.6%
mips64el             465 069 587       -----     +0.622%
ppc                  341 362 186       -----     +0.952%
ppc64                393 774 041       -----      +0.96%
ppc64le              393 980 143       -----     +0.965%
riscv64              351 724 348       -----     +0.789%
s390x                494 446 271       -----     +0.603%
sh4                  402 706 376       -----     +0.909%
sparc64              495 976 191       -----     +1.196%
x86_64               402 960 485       -----     +0.841%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 709 690 647       -----     +2.418%
alpha              1 969 474 553       -----     +3.681%
arm                8 323 029 684       -----     +2.588%
hppa               3 188 294 839       -----     +2.899%
m68k               4 953 965 778       -----    +15.154%
mips               2 123 943 004       -----     +3.057%
mipsel             2 124 244 955       -----     +3.049%
mips64             1 999 047 031       -----     +3.405%
mips64el           1 996 439 999       -----     +3.409%
ppc                2 819 280 938       -----     +5.435%
ppc64              2 768 165 845       -----     +5.512%
ppc64le            2 724 806 675       -----     +5.604%
riscv64            1 638 351 189       -----     +4.022%
s390x              2 519 116 050       -----     +3.364%
sh4                2 595 583 455       -----     +2.996%
sparc64            3 989 008 963       -----     +2.747%
x86_64             2 033 499 313       -----     +3.236%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 193 410 462       -----     +2.917%
alpha              1 521 303 814       -----     +4.194%
arm                3 465 460 307       -----     +2.756%
hppa               2 280 010 534       -----      +3.82%
m68k               1 843 202 992       -----     +3.584%
mips               1 558 052 835       -----     +3.864%
mipsel             1 560 655 607       -----     +3.851%
mips64             1 563 417 403       -----     +4.412%
mips64el           1 542 690 342       -----     +4.475%
ppc                1 728 728 950       -----     +3.667%
ppc64              1 842 421 996       -----     +3.554%
ppc64le            1 791 824 958       -----     +3.661%
riscv64            1 348 907 379       -----     +4.657%
s390x              2 184 081 776       -----      +3.32%
sh4                1 946 528 533       -----     +3.626%
sparc64            3 452 236 449       -----     +2.938%
x86_64             1 813 576 214       -----     +3.538%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 592 205 620       -----     +2.467%
alpha              1 855 846 445       -----     +3.488%
arm                7 347 704 986       -----     +2.682%
hppa               4 758 733 943       -----     +3.542%
m68k               2 376 798 588       -----     +3.566%
mips               2 166 599 565       -----     +2.532%
mipsel             2 163 390 280       -----     +2.528%
mips64             2 029 253 394       -----     +3.117%
mips64el           2 011 641 429       -----     +3.145%
ppc                2 492 947 209       -----     +2.673%
ppc64              2 464 682 643       -----     +2.487%
ppc64le            2 445 256 451       -----     +2.506%
riscv64            1 625 063 810       -----     +3.954%
s390x              4 194 613 570       -----     +6.623%
sh4                2 164 160 226       -----     +3.167%
sparc64            4 299 510 991       -----     +4.064%
x86_64             2 940 036 679       -----     +2.634%
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 487 801 290       -----     +1.939%
alpha              1 680 735 531       -----     +2.836%
arm               11 563 192 349       -----     +2.848%
hppa               7 272 822 842       -----     +3.263%
m68k               1 998 826 242       -----     +3.199%
mips               1 656 588 805       -----     +1.959%
mipsel             1 659 453 754       -----     +1.947%
mips64             1 955 539 579       -----     +2.447%
mips64el           1 943 610 758       -----     +2.463%
ppc                2 320 357 433       -----     +2.332%
ppc64              2 552 635 768       -----     +2.741%
ppc64le            2 547 383 687       -----     +2.749%
riscv64            1 520 870 450       -----     +3.159%
s390x              5 497 983 200       -----     +1.078%
sh4                2 323 256 731       -----     +3.411%
sparc64            3 427 096 026       -----      +4.73%
x86_64             1 729 371 786       -----     +2.806%
--------------------------------------------------------


</pre></body></html>

--===============8223234112466865143==--

