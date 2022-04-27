Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61890511884
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 15:51:03 +0200 (CEST)
Received: from localhost ([::1]:54118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nji4M-0007Vb-Fn
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 09:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1094d0c61=anthony.perard@citrix.com>)
 id 1njhvo-0008Uj-25; Wed, 27 Apr 2022 09:42:12 -0400
Received: from esa5.hc3370-68.iphmx.com ([216.71.155.168]:4300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1094d0c61=anthony.perard@citrix.com>)
 id 1njhvm-0000J1-Ao; Wed, 27 Apr 2022 09:42:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1651066930;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1EftjlPb2D5bL7c8oYZxtZPU4mzZ887UzPNIbQPwjq4=;
 b=HotkF5CSzd7yG76FexzaR6znN6qGkWHyLV+Zq2pArDZC++rnPD/0K5D0
 R76S8JnLPpawqnbdOC8N2fMnbncjl7NPiPoVnlKpLM+5o4h5ayRQZF/uK
 X3uNCd9CozpDxDcv9K5+jPQqlnjDktKB8J/cAupXmXRFCW6UE0W5FPUKq k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 69441940
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DQCqGapzxtXLq/t4U5DfJiBap9JeBmLMZRIvgKrLsJaIsI4StFCzt
 garIBmDbPqJZWb8etwja4Sx8hhXusLVnYJhSwM/qSo1RnhHoJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 4yq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBFJDrw+cSFBpjLiBmLIlY2bzsOleOmJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVIxDfFDfEgUNbbTr/D/9Nw1zYsnMFeW/3ZY
 qL1bBIxPUicOkwTYj/7Dro3gtyBqWPddwR0tRXEo/U++G6U0jBuhe2F3N39JYXRGJQ9clyjj
 nrM+GLrAxcbHMaSxTqM7jSngeqntTr2XZ9XCKe56P9jhHWVwWocDgBQUkG0ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c8JZDukS+AyLjK3O7G6xGmgZUj5pctEqtMYqAzct0
 zehht7sGHljvaOYTVqb8bGbqy70PjIaRUcZfjMNRwYB59jloakwgwjJQ9IlF7S65uAZAhmpn
 WrM9nJnwexO04hbjM1X4GwrnRqGm7+STQFy5T7qX3q0yh1YZ6W+SL2BvA2zAel7EK6VSVyIv
 X4hkseY7fwTAZzlqBFhUNnhD5nyua/bbWS0bUpHWsB4qm/zoyLLkZV4umkWGat/DioTldYFi
 mf3sBgZ2pJcNWDCgURfM9PoUJRCIUQN+L3YuhHogjhmP8AZmOyvpngGiausM4fFyhVErE3HE
 c3HGftA9F5DYUid8BK4Rv0GzZggzT0kyGXYSPjTlkr6ievFOCTNFuxeajNii9zVC4ve/m3oH
 yt3bZPWm32zrsWjCsUozWLjBQ9TdiVqbXwHg8dWavSCMmJb9JIJUJfsLUcaU9U9xcx9z76Ql
 lnkAx8w4Aev1BXvdFTRAlg+OeyHYHqKhS9iVcDaFQ3zgCZLjEfGxPp3SqbbipF6qrw+laIkE
 6htlgfpKq0ndwkrMg81NfHVxLGOvjzx7e5SF0JJuAQCQqM=
IronPort-HdrOrdr: A9a23:DpnpmamqKWNV1nOW1Z4xPcpiZaLpDfIs3DAbv31ZSRFFG/Fxl6
 iV8sjz8SWE7Ar5OUtQ/OxoV5PsfZqxz/JICMwqTNCftWrdyQmVxeNZjbcKqgeIc0aVygce79
 YCT0EXMqyXMbEQt6fHCWeDfOod/A==
X-IronPort-AV: E=Sophos;i="5.90,293,1643691600"; d="scan'208";a="69441940"
Date: Wed, 27 Apr 2022 14:41:52 +0100
To: Thomas Huth <thuth@redhat.com>
CC: <qemu-devel@nongnu.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul
 Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 <qemu-trivial@nongnu.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] qemu-options: Limit the -xen options to x86 and arm
Message-ID: <YmlIICWzw0wDBE31@perard.uk.xensource.com>
References: <20220427133156.344418-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220427133156.344418-1-thuth@redhat.com>
Received-SPF: pass client-ip=216.71.155.168;
 envelope-from=prvs=1094d0c61=anthony.perard@citrix.com;
 helo=esa5.hc3370-68.iphmx.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Apr 27, 2022 at 03:31:56PM +0200, Thomas Huth wrote:
> The Xen hypervisor is only available on x86 and arm - thus let's
> limit the related options to these targets.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

