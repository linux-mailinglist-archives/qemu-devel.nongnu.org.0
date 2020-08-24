Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0FE250B66
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 00:07:44 +0200 (CEST)
Received: from localhost ([::1]:51844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAKcx-0004Xz-L8
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 18:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kAKY6-0000Tr-Fl
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 18:02:42 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:35411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kAKY4-0000Ig-Hx
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 18:02:42 -0400
Received: by mail-wm1-x32a.google.com with SMTP id o21so330673wmc.0
 for <qemu-devel@nongnu.org>; Mon, 24 Aug 2020 15:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=d7LODrtYZQqrA/AyNhpF2rgra7LZ2tQz69oPjqpQjoc=;
 b=NZRaD8J/ZK04oIw7NRugtG0hK5ih6Zgr2M5nviBnzeizxrUZ3L5RO5NXDGPPN1lCnM
 Wn0XxrsiGboRvNZs3Z+hRsuHBXrtuYMMzXgJ7T3scLwKGISY5iPRP8leOh/Ek3Rnzb2N
 AradCEXqJBo59yTdUgXgEu9c4O5r9QPJMeKplV6YhPJO1PBPPNYji1fpC7x24NqwN0K6
 zQDXvt886oe5uLxPrDpIDxFMAtW6tuIA3L0mmmPFqH5cXZiJmKlqCS2+C+HGiMj80gmT
 iA+2/mfsIoJOcspjB/bT9k8jc9cODakYT4q6o3XK+umnl9QZui7vCWRTWpwq6/ONQAQo
 aDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=d7LODrtYZQqrA/AyNhpF2rgra7LZ2tQz69oPjqpQjoc=;
 b=J/ssU4vgHj5ZylHmr1uhjH6IjYSD5Ixwz+klVPw7d9edfURif4QV5w215IcRoQEKco
 SiUR9yrXxiuZvQfqd31q7BOSjRgFgWjLzt5HQR4yLXC7Q95tHIO2J1wdQD/OGD3dW9hh
 ZIbD8pmcpd7RpGC/QhLcyzEDN+xHkRNxjfiM0QPKnibeLN/flH6Pyl8G/cD5W+3YaYgD
 Oi6smY5jPceObgQ8zLR6zGajCCcgFatR3FFlMnCCIDHJODOO8rOHqExd5E9o29b3omjQ
 juQPtGRs9zNPAYjy1Q920P/vXQct9L8vR6aq3qspEZRFkGghPfTxDexI1w2Sd0Ux2Urf
 k0bQ==
X-Gm-Message-State: AOAM5309IPGp+5GYZuAFeqp2dEDuIhkGFTsmNX6i3pGoLxK+8KYKx+rB
 IheTnaEToHwNrXVpRJUJYhsLAmsh+o+S8Q==
X-Google-Smtp-Source: ABdhPJws/4AXS7uAcE0vKNMaaL0xTjenmAXNoGRgPmvJz+CSSuFnwIetJKIbjJXX6M+hGbGp7DBo4w==
X-Received: by 2002:a1c:7c0d:: with SMTP id x13mr1159281wmc.164.1598306558098; 
 Mon, 24 Aug 2020 15:02:38 -0700 (PDT)
Received: from [127.0.1.1] ([41.40.243.111])
 by smtp.gmail.com with ESMTPSA id f63sm1711456wmf.9.2020.08.24.15.02.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 15:02:37 -0700 (PDT)
Message-ID: <5f4438fd.1c69fb81.2d70c.41dc@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============5634973289683540170=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 25 Aug 2020 00:02:34 +0200
Subject: [REPORT] Nightly Performance Tests - Monday, August 24, 2020
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-wm1-x32a.google.com
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

--===============5634973289683540170==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-08-24 21:30:01
End Time (UTC)   : 2020-08-24 22:02:34
Execution Time   : 0:32:33.288312

Status           : SUCCESS

Note:
Changes denoted by '-----' are less than 0.01%.

--------------------------------------------------------
            SUMMARY REPORT - COMMIT 30aa1944
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 158 336 369       -----     +1.692%
alpha              1 914 963 828       -----     +3.524%
arm                8 076 406 621       -----     +2.304%
hppa               4 268 707 368       -----     +3.355%
m68k               2 690 268 056       -----     +7.131%
mips               1 862 013 209       -----     +2.492%
mipsel             2 008 201 160       -----     +2.673%
mips64             1 918 633 309       -----     +2.818%
mips64el           2 051 562 603       -----     +3.026%
ppc                2 480 494 245       -----     +3.116%
ppc64              2 576 749 439       -----     +3.143%
ppc64le            2 558 895 447       -----     +3.174%
riscv64            1 406 714 486       -----     +2.651%
s390x              3 158 130 515       -----     +3.118%
sh4                2 364 446 984       -----      +3.33%
sparc64            3 318 536 224       -----      +3.85%
x86_64             1 775 853 879       -----     +2.157%
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 062 565 290       -----     +1.423%
alpha              3 191 861 945       -----     +3.696%
arm               16 357 168 614       -----     +2.347%
hppa               7 238 406 927       -----     +3.229%
m68k               4 294 010 671       -----     +9.692%
mips               3 051 404 978       -----     +2.426%
mipsel             3 231 499 722       -----     +2.869%
mips64             3 245 835 252       -----     +2.596%
mips64el           3 414 195 149       -----     +3.021%
ppc                4 916 527 458       -----     +4.782%
ppc64              5 098 142 111       -----     +4.565%
ppc64le            5 082 413 487       -----      +4.58%
riscv64            2 192 308 138       -----     +1.956%
s390x              4 584 495 400       -----     +2.896%
sh4                3 949 034 207       -----     +3.464%
sparc64            4 586 194 372       -----     +4.237%
x86_64             2 484 102 186       -----     +1.751%
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 210 178 166       -----     +1.493%
alpha              1 494 130 687       -----      +2.15%
arm                8 262 938 105       -----     +2.665%
hppa               5 207 303 578       -----     +3.047%
m68k               1 725 851 873       -----     +2.526%
mips               1 495 206 180       -----     +1.491%
mipsel             1 497 138 038       -----     +1.478%
mips64             1 715 388 602       -----     +1.892%
mips64el           1 695 271 234       -----     +1.913%
ppc                2 014 568 021       -----      +1.82%
ppc64              2 206 259 282       -----     +2.138%
ppc64le            2 197 993 199       -----     +2.146%
riscv64            1 354 923 136       -----     +2.396%
s390x              2 916 235 947       -----     +1.241%
sh4                1 990 530 126       -----     +2.669%
sparc64            2 872 225 164       -----     +3.757%
x86_64             1 553 989 229       -----      +2.12%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 412 251 532       -----       +0.3%
alpha              3 233 986 239       -----     +7.473%
arm                8 545 174 231       -----     +1.088%
hppa               3 528 318 810       -----      +5.81%
m68k               3 919 059 909       -----    +18.431%
mips               2 344 753 389       -----      +4.09%
mipsel             3 329 876 697       -----     +5.176%
mips64             2 359 044 360       -----     +4.076%
mips64el           3 343 661 682       -----     +5.167%
ppc                3 209 624 695       -----     +3.252%
ppc64              3 287 569 946       -----     +3.175%
ppc64le            3 287 263 535       -----     +3.175%
riscv64            1 221 613 887       -----     +0.278%
s390x              2 874 191 493       -----     +5.827%
sh4                3 543 941 254       -----     +6.415%
sparc64            3 426 141 530       -----     +7.139%
x86_64             1 248 927 635       -----     +0.323%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              598 665 130       -----     +0.583%
alpha                372 437 394       -----     +0.677%
arm                  746 587 627       -----     +1.463%
hppa                 674 263 766       -----     +1.181%
m68k                 410 487 995       -----     +0.898%
mips                 499 678 161       -----     +0.527%
mipsel               499 490 653       -----     +0.495%
mips64               481 549 317       -----     +0.598%
mips64el             465 054 041       -----     +0.618%
ppc                  341 342 592       -----     +0.947%
ppc64                393 785 159       -----     +0.963%
ppc64le              393 971 779       -----     +0.963%
riscv64              351 720 134       -----     +0.788%
s390x                494 416 144       -----     +0.597%
sh4                  402 665 944       -----     +0.898%
sparc64              495 944 478       -----      +1.19%
x86_64               402 938 941       -----     +0.836%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 709 664 737       -----     +2.417%
alpha              1 969 457 438       -----      +3.68%
arm                8 323 002 004       -----     +2.587%
hppa               3 189 794 632       -----     +2.948%
m68k               4 953 924 484       -----    +15.153%
mips               2 123 895 864       -----     +3.054%
mipsel             2 124 202 303       -----     +3.047%
mips64             1 999 042 806       -----     +3.405%
mips64el           1 996 423 659       -----     +3.408%
ppc                2 819 872 952       -----     +5.457%
ppc64              2 768 471 742       -----     +5.523%
ppc64le            2 725 098 250       -----     +5.615%
riscv64            1 638 340 179       -----     +4.022%
s390x              2 519 073 083       -----     +3.362%
sh4                2 595 539 662       -----     +2.994%
sparc64            3 988 975 552       -----     +2.747%
x86_64             2 033 476 218       -----     +3.235%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 193 373 559       -----     +2.915%
alpha              1 521 286 637       -----     +4.192%
arm                3 465 448 011       -----     +2.756%
hppa               2 280 017 088       -----      +3.82%
m68k               1 843 186 488       -----     +3.583%
mips               1 558 003 932       -----     +3.861%
mipsel             1 560 574 135       -----     +3.845%
mips64             1 563 415 761       -----     +4.412%
mips64el           1 542 674 264       -----     +4.474%
ppc                1 728 709 596       -----     +3.665%
ppc64              1 842 432 597       -----     +3.555%
ppc64le            1 791 816 129       -----      +3.66%
riscv64            1 348 876 263       -----     +4.654%
s390x              2 184 062 020       -----     +3.319%
sh4                1 946 490 212       -----     +3.624%
sparc64            3 452 207 125       -----     +2.937%
x86_64             1 813 554 811       -----     +3.537%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 592 199 352       -----     +2.467%
alpha              1 855 831 922       -----     +3.487%
arm                7 347 723 856       -----     +2.682%
hppa               4 758 741 867       -----     +3.542%
m68k               2 376 808 725       -----     +3.567%
mips               2 166 589 674       -----     +2.531%
mipsel             2 163 382 129       -----     +2.528%
mips64             2 029 252 026       -----     +3.117%
mips64el           2 011 625 572       -----     +3.144%
ppc                2 492 950 550       -----     +2.673%
ppc64              2 464 690 857       -----     +2.487%
ppc64le            2 445 247 739       -----     +2.505%
riscv64            1 625 063 760       -----     +3.954%
s390x              4 194 600 196       -----     +6.623%
sh4                2 164 140 162       -----     +3.166%
sparc64            4 299 508 070       -----     +4.064%
x86_64             2 940 469 930       -----     +2.649%
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 487 793 192       -----     +1.939%
alpha              1 680 718 362       -----     +2.835%
arm               11 563 210 523       -----     +2.848%
hppa               7 272 812 278       -----     +3.263%
m68k               1 998 814 307       -----     +3.198%
mips               1 656 573 497       -----     +1.958%
mipsel             1 659 445 605       -----     +1.946%
mips64             1 955 538 349       -----     +2.447%
mips64el           1 943 595 227       -----     +2.462%
ppc                2 320 358 101       -----     +2.332%
ppc64              2 552 643 825       -----     +2.742%
ppc64le            2 547 359 459       -----     +2.748%
riscv64            1 520 870 392       -----     +3.159%
s390x              5 497 969 843       -----     +1.078%
sh4                2 323 234 305       -----      +3.41%
sparc64            3 427 093 504       -----     +4.729%
x86_64             1 729 372 088       -----     +2.806%
--------------------------------------------------------


</pre></body></html>

--===============5634973289683540170==--

