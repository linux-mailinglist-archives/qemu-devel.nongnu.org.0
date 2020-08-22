Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C7D24EA14
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Aug 2020 00:36:08 +0200 (CEST)
Received: from localhost ([::1]:56602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9c7K-0007AV-Jk
	for lists+qemu-devel@lfdr.de; Sat, 22 Aug 2020 18:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1k9c6d-0006kH-2K
 for qemu-devel@nongnu.org; Sat, 22 Aug 2020 18:35:23 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1k9c6a-0001ya-Lr
 for qemu-devel@nongnu.org; Sat, 22 Aug 2020 18:35:22 -0400
Received: by mail-wr1-x42d.google.com with SMTP id y3so5147136wrl.4
 for <qemu-devel@nongnu.org>; Sat, 22 Aug 2020 15:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=iGdnWGHxFYtOpKSsAMvwVOcrD60pKawks0CTJgirzbY=;
 b=hwmJ/czgiil46dRWhQ7+WwcHR8JvYJH7+w5eKYNOC8JSG5sJ5ryMf5TKpRp/c8lyCo
 bbRHU1Fo/Oq5nOK85Xf1wED3cTuMArWgHp/IqJ6QD4el3Ro3Pf27KXU7lvwRNhm3zMR1
 5djTeYabc1vd8j4OgCx0FsGdFLlvVVJqDpx1syi7ENzPI7s+ymOnF/LBIkcYhrajLxRl
 voIvVVP+ukICJYJQqthm5qm/lX8iZNbPOcvUzrbRCDEdLgobUhAcg97QViT+ZfZPjLCp
 XayNTfN0OBDmyJkXbMXgNKP2ptvj81gS6Csw5F8sRAqq8ElYP5j5UBG5yIm0x5cTZjaU
 f0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=iGdnWGHxFYtOpKSsAMvwVOcrD60pKawks0CTJgirzbY=;
 b=BfwnTHLKEm+Zm5PqBqhNA8/U7+kcOck1L42UqgwP0tLeLNP5PEUp5kij+00wY+vkkF
 wyUrTF6EwS6HR90GSSrt+LQ9JX1vKewaiGK4MrALODi+PAjDM2wydfQgWbgdvaFQr8Ud
 i1YA1WLwOBRgVBIxUGerUVL1djdh2EyqQePQWbKqltModva58gMWtPrF6mdcz9Li2mPY
 Ylpw5iZCuA96Cpyp9cct/MDnvDFgaUPfMblzLlf08cXbdpJP3DzfYFBJN1xpoYpiqLVZ
 z+oWZ1RSDo1y2T99P6wJzM1FVvBhfFfQHdwXzglmc5MFn0yKEWw78EKxp3N5PmJCCrXa
 cmOw==
X-Gm-Message-State: AOAM533dZkGR4ZjMlwxBxgk/v6olgk2mQNYTHLlQNsTkWFRItMZ9JV8t
 7ks1YUvKC0bU4xsW1X/YdAoOi1hx5Sg=
X-Google-Smtp-Source: ABdhPJwMVWdECkSGyuiJHsHcExwzpkpnTxi2q0r/S+mUUVavPF416pHEPkKYwXrRYiSjnu2htEDIvw==
X-Received: by 2002:adf:9bdd:: with SMTP id e29mr9120688wrc.394.1598135718489; 
 Sat, 22 Aug 2020 15:35:18 -0700 (PDT)
Received: from [127.0.1.1] ([197.58.166.83])
 by smtp.gmail.com with ESMTPSA id j2sm13041549wrp.46.2020.08.22.15.35.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 15:35:17 -0700 (PDT)
Message-ID: <5f419da5.1c69fb81.b56d8.c976@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============5153779098213923404=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 23 Aug 2020 00:35:14 +0200
Subject: [REPORT] Nightly Performance Tests - Saturday, August 22, 2020
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-wr1-x42d.google.com
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

--===============5153779098213923404==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-08-22 21:30:02
End Time (UTC)   : 2020-08-22 22:35:14
Execution Time   : 1:05:12.080181

Status           : SUCCESS

Note:
Changes denoted by '-----' are less than 0.01%.

--------------------------------------------------------
            SUMMARY REPORT - COMMIT 66e01f1c
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 158 307 521         N/A      +1.69%
alpha              1 914 952 274         N/A     +3.523%
arm                8 076 363 834         N/A     +2.304%
hppa               4 268 702 064         N/A     +3.355%
m68k               2 690 260 104         N/A     +7.131%
mips               1 862 001 379         N/A     +2.491%
mipsel             2 008 198 982         N/A     +2.673%
mips64             1 918 624 661         N/A     +2.817%
mips64el           2 051 547 914         N/A     +3.025%
ppc                2 480 477 927         N/A     +3.115%
ppc64              2 576 741 167         N/A     +3.143%
ppc64le            2 558 878 783         N/A     +3.173%
riscv64            1 406 694 841         N/A     +2.649%
s390x              3 158 128 415         N/A     +3.118%
sh4                2 364 441 076         N/A      +3.33%
sparc64            3 318 523 931         N/A     +3.849%
x86_64             1 775 833 886         N/A     +2.155%
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 062 524 484         N/A     +1.422%
alpha              3 191 860 820         N/A     +3.696%
arm               16 357 111 456         N/A     +2.347%
hppa               7 238 394 077         N/A     +3.229%
m68k               4 294 002 716         N/A     +9.692%
mips               3 051 383 586         N/A     +2.425%
mipsel             3 231 497 182         N/A     +2.868%
mips64             3 245 824 955         N/A     +2.596%
mips64el           3 414 179 260         N/A      +3.02%
ppc                4 916 505 731         N/A     +4.782%
ppc64              5 098 131 929         N/A     +4.565%
ppc64le            5 082 392 648         N/A     +4.579%
riscv64            2 192 278 694         N/A     +1.955%
s390x              4 584 482 755         N/A     +2.895%
sh4                3 949 025 009         N/A     +3.464%
sparc64            4 586 172 717         N/A     +4.237%
x86_64             2 484 077 965         N/A      +1.75%
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 210 139 976         N/A     +1.491%
alpha              1 494 107 932         N/A     +2.149%
arm                8 262 894 758         N/A     +2.665%
hppa               5 207 294 767         N/A     +3.046%
m68k               1 725 839 443         N/A     +2.526%
mips               1 495 193 055         N/A      +1.49%
mipsel             1 497 134 165         N/A     +1.478%
mips64             1 715 372 351         N/A     +1.891%
mips64el           1 695 257 618         N/A     +1.912%
ppc                2 014 547 431         N/A     +1.819%
ppc64              2 206 249 752         N/A     +2.138%
ppc64le            2 197 979 723         N/A     +2.145%
riscv64            1 354 902 721         N/A     +2.395%
s390x              2 916 235 101         N/A     +1.241%
sh4                1 990 519 487         N/A     +2.669%
sparc64            2 872 212 578         N/A     +3.757%
x86_64             1 553 963 533         N/A     +2.118%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 412 256 031         N/A       +0.3%
alpha              3 233 975 236         N/A     +7.473%
arm                8 545 132 276         N/A     +1.088%
hppa               3 528 308 660         N/A     +5.809%
m68k               3 919 054 398         N/A    +18.431%
mips               2 344 755 096         N/A      +4.09%
mipsel             3 329 879 162         N/A     +5.176%
mips64             2 359 034 998         N/A     +4.075%
mips64el           3 343 641 240         N/A     +5.166%
ppc                3 209 620 216         N/A     +3.251%
ppc64              3 287 564 684         N/A     +3.175%
ppc64le            3 287 248 767         N/A     +3.175%
riscv64            1 221 607 789         N/A     +0.277%
s390x              2 874 189 121         N/A     +5.827%
sh4                3 543 931 885         N/A     +6.415%
sparc64            3 426 127 801         N/A     +7.139%
x86_64             1 248 908 449         N/A     +0.321%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              598 635 872         N/A     +0.578%
alpha                372 421 222         N/A     +0.672%
arm                  746 544 230         N/A     +1.457%
hppa                 674 256 278         N/A      +1.18%
m68k                 410 476 853         N/A     +0.896%
mips                 499 663 909         N/A     +0.524%
mipsel               499 490 692         N/A     +0.495%
mips64               481 542 646         N/A     +0.597%
mips64el             465 033 649         N/A     +0.614%
ppc                  341 320 639         N/A      +0.94%
ppc64                393 774 571         N/A      +0.96%
ppc64le              393 957 211         N/A     +0.959%
riscv64              351 695 529         N/A     +0.781%
s390x                494 414 107         N/A     +0.596%
sh4                  402 677 009         N/A     +0.901%
sparc64              495 935 711         N/A     +1.188%
x86_64               402 914 568         N/A      +0.83%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 709 633 958         N/A     +2.415%
alpha              1 969 461 697         N/A     +3.681%
arm                8 322 956 437         N/A     +2.587%
hppa               3 189 784 517         N/A     +2.948%
m68k               4 953 918 450         N/A    +15.153%
mips               2 123 886 527         N/A     +3.054%
mipsel             2 124 204 999         N/A     +3.047%
mips64             1 999 038 752         N/A     +3.405%
mips64el           1 996 403 200         N/A     +3.407%
ppc                2 819 856 607         N/A     +5.457%
ppc64              2 768 466 658         N/A     +5.523%
ppc64le            2 725 083 310         N/A     +5.614%
riscv64            1 638 318 008         N/A      +4.02%
s390x              2 519 085 659         N/A     +3.363%
sh4                2 595 533 015         N/A     +2.994%
sparc64            3 988 967 378         N/A     +2.746%
x86_64             2 033 452 034         N/A     +3.234%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 193 337 446         N/A     +2.913%
alpha              1 521 267 818         N/A     +4.191%
arm                3 465 420 755         N/A     +2.755%
hppa               2 280 009 698         N/A      +3.82%
m68k               1 843 180 406         N/A     +3.583%
mips               1 557 994 765         N/A     +3.861%
mipsel             1 560 565 975         N/A     +3.845%
mips64             1 563 409 102         N/A     +4.412%
mips64el           1 542 659 364         N/A     +4.473%
ppc                1 728 687 784         N/A     +3.664%
ppc64              1 842 424 829         N/A     +3.554%
ppc64le            1 791 793 471         N/A     +3.659%
riscv64            1 348 857 225         N/A     +4.653%
s390x              2 184 054 588         N/A     +3.318%
sh4                1 946 483 580         N/A     +3.623%
sparc64            3 452 196 144         N/A     +2.936%
x86_64             1 813 535 877         N/A     +3.536%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 592 163 948         N/A     +2.466%
alpha              1 855 815 891         N/A     +3.486%
arm                7 347 681 813         N/A     +2.682%
hppa               4 758 749 058         N/A     +3.542%
m68k               2 376 803 208         N/A     +3.567%
mips               2 166 569 660         N/A      +2.53%
mipsel             2 163 373 985         N/A     +2.527%
mips64             2 029 242 790         N/A     +3.117%
mips64el           2 011 628 563         N/A     +3.145%
ppc                2 492 931 365         N/A     +2.673%
ppc64              2 464 683 175         N/A     +2.487%
ppc64le            2 445 233 035         N/A     +2.505%
riscv64            1 625 044 760         N/A     +3.953%
s390x              4 194 598 242         N/A     +6.623%
sh4                2 164 133 569         N/A     +3.166%
sparc64            4 299 497 135         N/A     +4.064%
x86_64             2 940 465 525         N/A     +2.649%
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 487 768 458         N/A     +1.938%
alpha              1 680 707 582         N/A     +2.834%
arm               11 563 168 951         N/A     +2.848%
hppa               7 272 819 461         N/A     +3.263%
m68k               1 998 805 364         N/A     +3.198%
mips               1 656 564 439         N/A     +1.957%
mipsel             1 659 445 702         N/A     +1.946%
mips64             1 955 531 700         N/A     +2.447%
mips64el           1 943 580 421         N/A     +2.461%
ppc                2 320 353 650         N/A     +2.332%
ppc64              2 552 633 745         N/A     +2.741%
ppc64le            2 547 342 102         N/A     +2.747%
riscv64            1 520 854 003         N/A     +3.158%
s390x              5 497 967 750         N/A     +1.078%
sh4                2 323 225 057         N/A      +3.41%
sparc64            3 427 081 984         N/A     +4.729%
x86_64             1 729 353 137         N/A     +2.805%
--------------------------------------------------------


</pre></body></html>

--===============5153779098213923404==--

