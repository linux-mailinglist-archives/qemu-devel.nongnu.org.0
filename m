Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCECE3D3B3F
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 15:35:10 +0200 (CEST)
Received: from localhost ([::1]:58824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6vKX-00025q-DG
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 09:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1m6vJ3-0000Wb-Dr
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 09:33:39 -0400
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3]:33354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1m6vJ1-0007GB-4b
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 09:33:36 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: fahien) with ESMTPSA id D818B1F44C46
To: qemu-devel@nongnu.org
From: Antonio Caggiano <antonio.caggiano@collabora.com>
Subject: virtio-gpu: Mapping blob resources
Message-ID: <0eb17319-0b1d-5f43-f5d9-8ccadb0839ef@collabora.com>
Date: Fri, 23 Jul 2021 15:33:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1098:0:82:1000:25:2eeb:e3e3;
 envelope-from=antonio.caggiano@collabora.com; helo=bhuna.collabora.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: kraxel@redhat.com, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 vivek.kasireddy@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I am trying to implement blob resource mapping support, but there is 
something I still did not manage to figure out.

According to the spec, VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB maps a host-only 
blob resource into an offset in the host visible memory region. So, I 
believe I will need something like:

 > void *data = g->hotstmem[mblob.offset]; // pseudo-code
 > virgl_renderer_resource_map(..., &data, ...);

Questions:
- Does my approach make sense?
- How do I get an address to the host visible memory region?


Best regards,
Antonio

