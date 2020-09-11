Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BF8267653
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Sep 2020 01:03:58 +0200 (CEST)
Received: from localhost ([::1]:34096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGs5E-0000O6-Jg
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 19:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kGs4X-0008PT-Bq
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 19:03:13 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kGs4V-0002WN-HL
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 19:03:13 -0400
Received: by mail-wr1-x42e.google.com with SMTP id o5so12862877wrn.13
 for <qemu-devel@nongnu.org>; Fri, 11 Sep 2020 16:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=TGhHEI8H4dGOjaLPjIxvh02K9w7V8z+0Ig3yYWbJGeE=;
 b=H69Xek16UfGmNeR5sfF/Vpxzm+Sw+OFEP1iogzzkBYEec1sV7fFAgxc024n1Z/ymuX
 /PLdBSji5hd0we3/9mlczU6B70/xQkh0CSpN6cQX/KWw606metO29FjBZCLErU2ZBTvR
 4TyT0YWSEkmPTnPjaPgVsIpwk2fcej1+OdEdNwyvOjdf3xpDPdwleCjTeQ7JgW1g+V7m
 36PXD+lXw6c7CPawwRG+rt3I0YzNZrxm7jeufCfEaKw2DwQ+feRiQ/CAuK3dP34qSr+5
 ycP0bNmAsDdxpR7qoF4V8QtxMy8YMnMthx6pieavVq0xt/Cj+VVOruRflWXcJx1sEsVX
 fGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=TGhHEI8H4dGOjaLPjIxvh02K9w7V8z+0Ig3yYWbJGeE=;
 b=CO0Vj7SI2cgIxgYy6mA+a8CfkVuBl8nq5plYWEsmi8LetLPnVwoXAv8+hQmZTpdrgi
 x+ywyRiWbNw6f9wtTjb8ANECUFgrdQiEO8XiCghI3R/siFc3bsRiSLOv4D9dk7BNVwrX
 NF0Vyj8pIIFSImzCKGuWqGOeZifnfVy2ucShnUJqXqQ1xisl+HWq1gfPC9/J55gCTt3U
 OCBoRXIxDIIicHMxBMWcFjASr5PBpunFeyENHg4EqxNxDwDgIalgoClLCwYWIY8neci9
 zBL89OTnvoFIzGutwMZsbRaqtwyGUrImywXUei5efpLw8wNwx4W+KTPMJSSO+9boMw5I
 pPGw==
X-Gm-Message-State: AOAM530TYxmCYGvM7KEQ5DIpcwj81ZTRBq5LcspXm8PzPlEOy0l1FbI3
 RyKbcN+w6iCrAsuE/SmmMg4l3gcv2ESh2g==
X-Google-Smtp-Source: ABdhPJzWLSlLztrl829E63P9atV2AvLMg11EY9KBnV89DCFJ723V4A+rDp/Rg81eOKlXWVK5gtmzdA==
X-Received: by 2002:adf:dd51:: with SMTP id u17mr4120554wrm.355.1599865389010; 
 Fri, 11 Sep 2020 16:03:09 -0700 (PDT)
Received: from [127.0.1.1] ([197.58.141.121])
 by smtp.gmail.com with ESMTPSA id 197sm6845215wme.10.2020.09.11.16.03.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 16:03:08 -0700 (PDT)
Message-ID: <5f5c022c.1c69fb81.aad9.ee88@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============5245507131259852137=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 12 Sep 2020 01:03:04 +0200
Subject: [REPORT] Nightly Performance Tests - Friday, September 11, 2020
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-wr1-x42e.google.com
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

--===============5245507131259852137==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-09-11 22:30:01
End Time (UTC)   : 2020-09-11 23:03:04
Execution Time   : 0:33:03.117362

Status           : SUCCESS

Note:
Changes denoted by '-----' are less than 0.01%.

--------------------------------------------------------
            SUMMARY REPORT - COMMIT f4ef8c9c
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 158 513 843       -----     +1.703%
alpha              1 914 941 891       -----     +3.522%
arm                8 076 528 799       -----     +2.308%
hppa               4 261 695 580       -----     +3.164%
m68k               2 690 298 148       -----     +7.134%
mips               1 861 897 036       -----     +2.484%
mipsel             2 008 241 453       -----     +2.676%
mips64             1 918 628 017       -----     +2.818%
mips64el           2 051 556 337       -----     +3.025%
ppc                2 480 183 459       -----      +3.11%
ppc64              2 576 716 032       -----     +3.143%
ppc64le            2 558 829 700       -----     +3.171%
riscv64            1 406 687 602       -----     +2.648%
s390x              3 158 138 787       -----     +3.119%
sh4                2 364 612 143       -----     +3.342%
sparc64            3 318 699 089       -----     +3.855%
x86_64             1 775 943 173       -----     +2.167%
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 062 748 276       -----     +1.429%
alpha              3 191 839 657       -----     +3.695%
arm               16 357 293 127       -----     +2.348%
hppa               7 228 414 335       -----     +3.086%
m68k               4 294 064 495       -----     +9.693%
mips               3 051 311 472       -----     +2.423%
mipsel             3 231 555 095       -----      +2.87%
mips64             3 245 820 200       -----     +2.596%
mips64el           3 414 216 987       -----     +3.021%
ppc                4 914 567 276       -----     +4.741%
ppc64              5 098 155 410       -----     +4.565%
ppc64le            5 082 397 275       -----     +4.579%
riscv64            2 192 270 574       -----     +1.954%
s390x              4 584 588 182       -----     +2.898%
sh4                3 949 203 367       -----     +3.468%
sparc64            4 586 103 876       -----     +4.235%
x86_64             2 484 248 999       -----     +1.757%
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 210 362 911       -----     +1.501%
alpha              1 494 108 252       -----     +2.149%
arm                8 263 045 423       -----     +2.667%
hppa               5 207 328 962       -----     +3.047%
m68k               1 725 884 327       -----     +2.528%
mips               1 495 104 505       -----     +1.484%
mipsel             1 497 168 730       -----      +1.48%
mips64             1 715 424 042       -----     +1.894%
mips64el           1 695 213 527       -----     +1.909%
ppc                2 014 610 319       -----     +1.822%
ppc64              2 206 271 027       -----     +2.139%
ppc64le            2 197 976 823       -----     +2.145%
riscv64            1 354 882 544       -----     +2.393%
s390x              2 916 096 113       -----     +1.236%
sh4                1 990 699 387       -----     +2.678%
sparc64            2 874 141 101       -----     +3.827%
x86_64             1 554 141 680       -----      +2.13%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 412 417 236       -----     +0.312%
alpha              3 233 966 468       -----     +7.472%
arm                8 545 303 870       -----      +1.09%
hppa               3 483 540 419       -----     +4.467%
m68k               3 919 115 602       -----    +18.433%
mips               2 344 638 746       -----     +4.085%
mipsel             3 329 921 883       -----     +5.178%
mips64             2 359 031 228       -----     +4.075%
mips64el           3 343 641 386       -----     +5.166%
ppc                3 209 506 357       -----     +3.248%
ppc64              3 287 507 267       -----     +3.173%
ppc64le            3 287 148 706       -----     +3.172%
riscv64            1 221 608 069       -----     +0.277%
s390x              2 874 161 282       -----     +5.826%
sh4                3 544 110 967       -----     +6.421%
sparc64            3 426 095 311       -----     +7.138%
x86_64             1 249 074 645       -----     +0.335%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              598 849 312       -----     +0.614%
alpha                372 412 908       -----      +0.67%
arm                  746 702 779       -----     +1.479%
hppa                 674 281 317       -----     +1.184%
m68k                 410 576 843       -----      +0.92%
mips                 499 563 876       -----     +0.504%
mipsel               499 533 503       -----     +0.504%
mips64               481 540 597       -----     +0.596%
mips64el             465 053 716       -----     +0.618%
ppc                  341 381 830       -----     +0.958%
ppc64                393 799 065       -----     +0.966%
ppc64le              393 955 293       -----     +0.959%
riscv64              351 688 648       -----     +0.779%
s390x                494 450 981       -----     +0.604%
sh4                  402 835 190       -----     +0.941%
sparc64              495 861 295       -----     +1.173%
x86_64               403 090 799       -----     +0.874%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 709 847 306       -----     +2.424%
alpha              1 969 437 851       -----     +3.679%
arm                8 323 166 840       -----     +2.589%
hppa               3 188 330 450       -----     +2.901%
m68k               4 953 952 829       -----    +15.153%
mips               2 123 786 281       -----     +3.049%
mipsel             2 124 247 567       -----     +3.049%
mips64             1 999 035 776       -----     +3.405%
mips64el           1 996 425 980       -----     +3.409%
ppc                2 819 300 699       -----     +5.436%
ppc64              2 768 187 525       -----     +5.513%
ppc64le            2 724 779 605       -----     +5.602%
riscv64            1 638 316 549       -----      +4.02%
s390x              2 519 121 786       -----     +3.364%
sh4                2 595 711 570       -----     +3.001%
sparc64            3 988 893 345       -----     +2.745%
x86_64             2 033 625 277       -----     +3.242%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 193 564 812       -----     +2.924%
alpha              1 521 266 952       -----     +4.191%
arm                3 465 580 692       -----      +2.76%
hppa               2 280 044 489       -----     +3.822%
m68k               1 843 190 599       -----     +3.583%
mips               1 557 893 551       -----     +3.854%
mipsel             1 560 655 514       -----     +3.851%
mips64             1 563 406 060       -----     +4.412%
mips64el           1 542 673 984       -----     +4.474%
ppc                1 728 751 312       -----     +3.668%
ppc64              1 842 445 533       -----     +3.555%
ppc64le            1 791 797 554       -----     +3.659%
riscv64            1 348 874 231       -----     +4.654%
s390x              2 184 087 187       -----      +3.32%
sh4                1 946 659 734       -----     +3.633%
sparc64            3 452 121 172       -----     +2.934%
x86_64             1 813 701 740       -----     +3.546%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 592 362 566       -----     +2.473%
alpha              1 855 806 975       -----     +3.486%
arm                7 347 825 192       -----     +2.684%
hppa               4 758 768 452       -----     +3.543%
m68k               2 376 785 973       -----     +3.566%
mips               2 166 445 637       -----     +2.524%
mipsel             2 163 392 909       -----     +2.528%
mips64             2 029 241 467       -----     +3.117%
mips64el           2 011 627 803       -----     +3.144%
ppc                2 492 969 878       -----     +2.674%
ppc64              2 464 703 380       -----     +2.488%
ppc64le            2 445 226 148       -----     +2.504%
riscv64            1 625 025 467       -----     +3.952%
s390x              4 194 616 326       -----     +6.623%
sh4                2 164 291 387       -----     +3.174%
sparc64            4 299 395 570       -----     +4.062%
x86_64             2 940 165 088       -----     +2.639%
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 487 958 326       -----     +1.946%
alpha              1 680 696 070       -----     +2.834%
arm               11 563 312 474       -----     +2.849%
hppa               7 272 856 216       -----     +3.263%
m68k               1 998 814 517       -----     +3.198%
mips               1 656 432 223       -----     +1.949%
mipsel             1 659 456 427       -----     +1.947%
mips64             1 955 524 766       -----     +2.447%
mips64el           1 943 597 314       -----     +2.462%
ppc                2 320 380 001       -----     +2.333%
ppc64              2 552 659 049       -----     +2.742%
ppc64le            2 547 356 202       -----     +2.748%
riscv64            1 520 834 736       -----     +3.157%
s390x              5 497 988 441       -----     +1.078%
sh4                2 323 385 546       -----     +3.417%
sparc64            3 426 981 045       -----     +4.726%
x86_64             1 729 497 160       -----     +2.814%
--------------------------------------------------------


</pre></body></html>

--===============5245507131259852137==--

