Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D368CCA10
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Oct 2019 15:16:52 +0200 (CEST)
Received: from localhost ([::1]:56660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGjvV-0005U6-6w
	for lists+qemu-devel@lfdr.de; Sat, 05 Oct 2019 09:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56792)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lukasstraub2@web.de>) id 1iGjkx-0002my-EM
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 09:05:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lukasstraub2@web.de>) id 1iGjkv-0005VR-AE
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 09:05:55 -0400
Received: from mout.web.de ([212.227.17.11]:56709)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <lukasstraub2@web.de>)
 id 1iGjks-0005QH-Qc; Sat, 05 Oct 2019 09:05:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1570280719;
 bh=yF+eHxnUrNZCjpVP2+f53IFIbETlOy/g33p9pTG35YY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=iWD6T5GjSxbyyuYjBaoMVYODoDcyiCNEzoB0/Ca+fGTn0+h2L4udCHecmsnnKXcu/
 8L0nGBeaotkJzW6LMhjjOMivlThMOS/4llH7yHjdHdXmDBdhqDR+a6aZ+qCoE+aARV
 8SwEQRvj4JCP/es3uiyQbzQAhp5NEAwjrh4AuloE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([87.123.206.231]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MPYJJ-1iCasw2PRp-004gjT; Sat, 05
 Oct 2019 15:05:19 +0200
Date: Sat, 5 Oct 2019 15:05:16 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v6 0/4] colo: Add support for continuous replication
Message-ID: <cover.1570280098.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zgXmEhbgHNNe2u8p+OfwtZ6UtCO8GNYlnMkzPzdPH56T7V5NlK2
 EuAf1vrWjIKXLn4DoJzZACkvImZpfFA7ewHw1wMHZcurUe98hSpQOlxrmtD2wJv8vvHY1oM
 AU0221rSiVl2PRGH/N/khuSt1gzF3UhNNuVjFlzZk5JwMpDJUdKCNSaZJaErGAXEPJiRWC5
 acixCFjVEjDsntKe/kfpg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1vVNW9b+iP4=:87k+r61uAvx6gFzs9gXsNL
 k6WXDEoQcwDObL3rUX+QvFHr/xABpIRN+PuJ+mVJaGNYlBdCU0eOCQW20vFrZPJ1A936Xz81Q
 I3/H540WZWBCFQnJi23WuDmzZ6gUUhq0/7ZAn7i0HvZ2xQqCSRNFoVFDNsw83NDHjQDk6OmXj
 pcFdGKsTm4R0fh6GzUtGPbkgscrFE6hhvMCde1wmjgSZT4usYgmtYucE085q5NbXyQ5tn/nRc
 gZmBC6jEmxAEDJWxOHxX9F+1ZnErOxJhy+DCiHCngNO3zk3JSZfxLt+a7TeVb7kmnesEuP3t7
 vWsuFaf/KfiRMphm4ddS5sc8B8HIK3SxRkpaA9eS1t1dSKtqv/vgYjbUFRSvk8ZJPyf5Z3Imk
 IHCLIgZmcE4RZYOa9Ozh2GYzIJJXeu70TuYROuNBM6orFmZ2js8hmtx02K74egbZJIuN4hi1X
 SFfmhAop7RPGgmk12g+0rQL0kRt6M7BjOEKVFtaizxRjfH9KKeXCNO6jh9LgNHwHPe2PTQQLc
 IOZVqk6QAllqFt3DcsKwJj91ryY26Xoyv5FBfQ2niSndspkWv/bCYkDsGiVvBQ7qHRCDDcLYB
 j3+S9LQ/uEuKpJ7K0lOksPeVcC8K03aWPBb1M+mIpqmb3n0adA1bRNw4oOAKVoz7SssF54sYD
 Aj2hLHEWtHxhJk9WwEttn/H6JvXIHgsaYJ3Z+cNDaB77XBuG89ST2NaqxV/rSR8Tx8pZvcCgV
 Y5Kr5qqcY0pkyqovCDuIIJmXHobIik8Y8VyzG7+3z1hDzl0kNszNt5ygyorQJIwpzkXP1WMaB
 lMHg5OlT5aobp/31UouyKMndTsQPhTwBceitQyFsq69bbswls+zBDZ+hhZeTmDdNDtsxzw26S
 lDG2n3mmEqefGRIQRy7Odr8t5FGdwD6nMkEtTL4vRc8wOnhxwftbl0f57fP8Mu/v/BWbsG00Y
 Pk4D3gPUWY4UQOWt5ejpDaT7jcetkpWwzTZ/aK3U+G2axBpYMm9X/FTG26HM2sRPtiMkB6W7E
 mtnP/pA1M8vAGs0dmjBTOFw0A2Ga2qa31gq/ANR6t20P1bPWjMpjq6GTNyZPTDYHm9LeMKOvM
 sdy7MXGzZ8V+59kfI3I2IFLSZTBu5DjDsmLR6o3TbA2KLgqNVHc2n6uSOjgga3HLGH6G7O7/n
 OfUS5zz4bg4v1+Kpl1TWDgHFqJgQufj/GIPgVK2jLbgnFLkw4f6IIYkCYAVriE0oUu426+sv4
 jx/CLBqRMOT4SQ4twP8wtiZedTfF0eUavUkDZwrukvc4YMxlfoYFYeadJqEQ=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.17.11
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Wen Congyang <wencongyang2@huawei.com>, Jason Wang <jasowang@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Zhang Chen <chen.zhang@intel.com>,
 Xie Changlong <xiechanglong.d@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Everyone,
These Patches add support for continuous replication to colo. This means
that after the Primary fails and the Secondary did a failover, the Seconda=
ry
can then become Primary and resume replication to a new Secondary.

Regards,
Lukas Straub

v6:
 - properly documented the position=3D and insert=3D options
 - renamed replication test
 - clarified documentation by using different ip's for primary and seconda=
ry
 - added Reviewed-by tags

v5:
 - change syntax for the position=3D parameter
 - fix spelling mistake

v4:
 - fix checkpatch.pl warnings

v3:
 - add test for replication changes
 - check if the filter to be inserted before/behind belongs to the same in=
terface
 - fix the error message for the position=3D parameter
 - rename term "after" -> "behind" and variable "insert_before" -> "insert=
_before_flag"
 - document the quorum node on the secondary side
 - simplify quorum parameters in documentation
 - remove trailing spaces in documentation
 - clarify the testing procedure in documentation

v2:
 - fix email formating
 - fix checkpatch.pl warnings
 - fix patchew error
 - clearer commit messages


Lukas Straub (4):
  block/replication.c: Ignore requests after failover
  tests/test-replication.c: Add test for for secondary node continuing
    replication
  net/filter.c: Add Options to insert filters anywhere in the filter
    list
  colo: Update Documentation for continuous replication

 block/replication.c        |  38 ++++++-
 docs/COLO-FT.txt           | 213 +++++++++++++++++++++++++++----------
 docs/block-replication.txt |  28 +++--
 include/net/filter.h       |   2 +
 net/filter.c               |  92 +++++++++++++++-
 qemu-options.hx            |  31 +++++-
 tests/test-replication.c   |  52 +++++++++
 7 files changed, 380 insertions(+), 76 deletions(-)

=2D-
2.20.1

