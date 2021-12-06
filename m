Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F8C469879
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 15:18:00 +0100 (CET)
Received: from localhost ([::1]:60066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muEoZ-0002mk-Om
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 09:17:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1muEOb-0000yp-AV; Mon, 06 Dec 2021 08:51:09 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:48639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1muEOV-0008Cx-Os; Mon, 06 Dec 2021 08:51:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=vZlE5SIpXaIZ2ByToDSa9l1PvpVDv9tP3aF8nktyH14=; b=tLntC6YgOkm5wkY8iMuMwQe2AN
 J6/hSDZnaBeH/UQV6rGW6uf1bEJrtnU9zSMH0M+rV2U9hpTG0PqvwotcI2MQdi0K293VBbGL6CNZ2
 xB0Gu6MNVCoUV2VwBv7A1eFLOpd0lH+W6kD+724axUQ+o6kHU4iNI+o4Bn1x8BlBNIdJOFS1j2I+p
 WF8v4sYAH1fIgSTzLN9Nnxsv027mBxjKtU7YVvRAR/x5rp4vrZi1UXOH9NrmoRce/iSVTTZMyG5u4
 6lOUXYs8IA/vgCsfBGLLDrFEIn+IsHszzcI4YxyX4AQxZKVJV/7xaakEkphCJCTGA9ILUquBzitRF
 K/XHy2kWZ663pA1mrZYKUBPOwyCjs3/YVr+JuDQkCaTYDG58/myzlPz5hZvtnpYwQ16llh+2hPBrk
 hAUFNmO42ry3YT9Ot2G4fPd/ADLAYx+/p2gqARoqPko7tu+cGQwK+iY1Ac5XgaGw2hyPTn5L+fgWS
 NI8E5KajMH8a6vx7sG9IIQFWa5PjIOHLBYlXqVIOzM49hB0q/3EaKCHRpy86nja2Kgab/48dHZwH8
 UJ94o2I2G1PP/8WByVujJjJYHIMoKanjJcMpu96t1n5SKEP7z3z9uofY7Ib7QD9upDTY0xgZm5wGr
 fEjIZD/Z//B/AH4oMx+QzkytJue51341MNBycmEog=;
To: qemu-devel@nongnu.org
Cc: Jonah Palmer <jonah.palmer@oracle.com>, mst@redhat.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Subject: Re: [PATCH v10 0/8] hmp,
 qmp: Add commands to introspect virtio devices
Date: Mon, 06 Dec 2021 14:50:57 +0100
Message-ID: <2322952.dU7V5S69UE@silver>
In-Reply-To: <1638794606-19631-1-git-send-email-jonah.palmer@oracle.com>
References: <1638794606-19631-1-git-send-email-jonah.palmer@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Reply-to:  Christian Schoenebeck <qemu_oss@crudebyte.com>
From:  Christian Schoenebeck via <qemu-devel@nongnu.org>

On Montag, 6. Dezember 2021 13:43:18 CET Jonah Palmer wrote:
> This series introduces new QMP/HMP commands to dump the status of a
> virtio device at different levels.
> 
> [Jonah: Rebasing previous patchset from Nov. 10 (v9). Original patches
>  are by Laurent Vivier from May 2020.
> 
>  Rebase from v9 to v10 includes reformatting virtio.json examples and
>  command structures for better consistency. Also removed all enums from
>  virtio.json and replaced their purpose with string literals.
> 
>  Removed @ndescs from VirtioQueueElement, as the number of descriptors
>  can be inferred from the length of the @descs chain.
> 
>  Lastly, removed the examples in hmp-commands-info.hx to fix 'inconsistent
>  literal block quoting' warning from Sphinx.]

I have not followed the entire discussion. AFAICS this is intended to monitor 
status information on virtio level only, like virtqueue fill status, etc.

One thing that I am looking for is monitoring device specific information 
above virtio level, e.g. certain performance numbers or statistics that only 
make sense for the specific device. That would not fit into any of these 
commands, right?

Best regards,
Christian Schoenebeck



