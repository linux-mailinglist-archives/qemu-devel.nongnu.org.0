Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CEC49E828
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 17:56:03 +0100 (CET)
Received: from localhost ([::1]:45946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD842-0002ni-Ks
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 11:56:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1nD6vS-0000DJ-QP
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:43:11 -0500
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155]:61838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1nD6vQ-0007h6-Fo
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:43:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1643298184;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=efTAYRaH8kKk4YUrUOGUaCgObgfHpjy2H/WjdfR6EdQ=;
 b=GhP5w2GmVACu5s9xtjQhMB3eyKaVz0ejlJA2QJGvzw6cTJv17pdmvtRO
 B6uSzpF6nQoAfdSqlgG3EAYN0tT7yXxozcnsibkjvkRsT82mipgiorfnZ
 DeJAqTiomksqeQ1mUDlf79/hXmGWoW+XVlPDb2kMiMWNjQEG+zJrIv1Om 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 9MxcrbD2qI40qH142XffYWYAM8o2kLDdlJuHhPiXAibg4XgNRWx4QcjMNMnGSvReyLl1c6e87d
 v/EtrI/6PtcdbKycsnBw3m05iqigHcOT57Nq7eQsyoKN9Phj0EIyDP4iqoygKI7O3gWrZzAbld
 7nxlEkuNI/GPf39KMV8OCwlHDryNHjeTg0DRWYVwX7QiUxlIxOSYEReS11pcShyYTSduDqtjsa
 tb5xIagMsM857Nz0PVsrD6gxHBgIP+te84w5jf+rV9RKkfRuV6VgnTEuLPNiEid2GxtaW30yxj
 mVtOCFbKZaK+lQs1vp25EIZK
X-SBRS: 5.2
X-MesageID: 62903643
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fTOIlaxdH1CHdy3uXrl6t+fxwSrEfRIJ4+MujC+fZmUNrF6WrkUFz
 mMdXWyBOK6IZGTwKt4kOYSz9ktX7JbRyd81Gwc/riAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wrRm2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/dQk
 elrk72gclcWMJHeod4RShhEFy4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY2JofRa2AO
 5FxhTxHUk3LOxtlYmcsMJM6sOGVrWfDfBpjpwfAzUYwyzeKl1EguFT3C/LNd8CHX4NQl1eUq
 2bC12D4BBgAM5qY0zXt2muhg/KKkS7lVYY6Erq++fh3xlqJyQQu5AY+DAXh56Pj0wjnBowZe
 xd8FjcSQbYa023ycv/bfg2D8EGKggwlYdZJEvE+51TYokbL2DqxCm8BRz9HTdUpss4qWDAnv
 mO0c8PV6S9H6+PMFy/EnluAhXbrYHVOczdeDcMRZVZdu7HeTJcPYgUjpzqJOIq8lZXLFD752
 FhmRwBu1uxI3abnO0hWlG0rYg5ARLCUFmbZBS2NBwpJCz+Vgqb/OuREDnCAtZ59wH6xFAXpg
 ZT9s5H2ABoyJZ+MjjeRZ+4GAauk4f2IWBWF3wI0RcJ5rGrwoyPyFWy13N2YDB03WirjUWSxC
 HI/RCsLvMMDVJdURfEfj32N5zQCkvG7SIWNugH8ZdtSeJlhHDJrDwk1DXN8K1vFyRB2+YlmY
 M/zWZ/1UR4yVPo7pBLrGbZ1+eJ7l0gWmDKILbimnkvP7FZrTCPPIVvzGAHQPrlRAWLtiFi9z
 uuzwOPTm0wAC7WvO3eOmWPRRHhTRUUG6VnNg5Q/Xoa+zsBOQQnN0tfdnuEsfZJLhaNQmrua9
 32xQBYAmlH+mWfGOUOBbXU6MOHjWpN2rHQaOy0wPAn3hyh/MNj3tKpPJYEqebQH9fB4yaImR
 fcyZMjdUO9ETS7K+mpBYMCl/pBibhmimSmHIzGhPGokZ5dlSgGQoo3kcwLj+TMgFC2yscdi8
 bSs2hmCGcgIRhh4DdaQY/WqlgvjsX8YkeN0fk3JPtgMJxm8rNk0c3T816ZlLdsNJBPPwiqh+
 zyXWRpI9/PQp4IV8cXSgfzWpYmeDOYjTFFRGHPW7OjqOHCCrHaj24JJTM2BYSvZCDHv4Kyna
 OhYk6P8PfkAkAoYuoZwCe82n6c35t+prL5G1AV0Wn7Mag3zWL9nJ3CH2+hJt7FMmeAF6VfnB
 BrX94kII6iNNePkDEUVdVgsYem03P0JniXfsKYuK0Lg6S4rpLeKXC2+5fVXZPCx+FetDL4Y/
 A==
IronPort-HdrOrdr: A9a23:+breVKDcf8rgZEvlHemg55DYdb4zR+YMi2TC1yhKJyC9Ffbo8/
 xG/c5rsyMc5wxwZJhNo7y90cq7MBbhHPxOkOos1N6ZNWGM0gaVxelZnOzfKlbbehEWmNQz6U
 4ZSdkdNOHN
X-IronPort-AV: E=Sophos;i="5.88,321,1635220800"; d="scan'208";a="62903643"
To: <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: [PULL 0/2] Xen queue
Date: Thu, 27 Jan 2022 15:42:44 +0000
Message-ID: <20220127154246.6281-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.145.155;
 envelope-from=anthony.perard@citrix.com; helo=esa3.hc3370-68.iphmx.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

The following changes since commit 48302d4eb628ff0bea4d7e92cbf6b726410eb4c3:

  Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20220126' into staging (2022-01-26 10:59:50 +0000)

are available in the Git repository at:

  https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20220127

for you to fetch changes up to a021a2dd8b790437d27db95774969349632f856a:

  xen-mapcache: Avoid entry->lock overflow (2022-01-27 15:14:21 +0000)

----------------------------------------------------------------
Xen patches

- bug fixes for mapcache and ioreq handling

----------------------------------------------------------------
Jason Andryuk (1):
      xen-hvm: Allow disabling buffer_io_timer

Ross Lagerwall (1):
      xen-mapcache: Avoid entry->lock overflow

 hw/i386/xen/xen-hvm.c      | 6 ++++--
 hw/i386/xen/xen-mapcache.c | 8 +++++++-
 2 files changed, 11 insertions(+), 3 deletions(-)

