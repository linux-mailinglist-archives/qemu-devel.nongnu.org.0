Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E443A296D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:36:46 +0200 (CEST)
Received: from localhost ([::1]:35816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrI3J-00055G-VX
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lrI0z-0001gR-Mz
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 06:34:22 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:44100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lrI0u-0004CJ-VX
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 06:34:21 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 91FF61FD37;
 Thu, 10 Jun 2021 10:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623321255; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tYnA8/ChtbCNTU9iNRu/Sa2Xnq/9VhGFMBLetvg4Haw=;
 b=k8pu4Wft4dcPNPNxALQAjsItTiDiXk4+GnfXYTLkirfIr2+FfzL210PxbcEhg9PVUz+XoZ
 xw0S7YNuT4JqFTcAkYOb2foP0TwuHYX6AA7ZGk6iP/4py2UDcAe0zuEOlM185QAB/s2Lek
 rIvJKdfMkjbplnGlUaEDQIQAFASv6kc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623321255;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tYnA8/ChtbCNTU9iNRu/Sa2Xnq/9VhGFMBLetvg4Haw=;
 b=7zkI+tdEGNnZMrnJHiGJW+8Fc95YFIAbrJSpbQnxai++ujGS0pw03UXcqGoFD8c0DoAkCl
 /Bo8Fjt3j0wGmBDg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 4D0CE118DD;
 Thu, 10 Jun 2021 10:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623321255; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tYnA8/ChtbCNTU9iNRu/Sa2Xnq/9VhGFMBLetvg4Haw=;
 b=k8pu4Wft4dcPNPNxALQAjsItTiDiXk4+GnfXYTLkirfIr2+FfzL210PxbcEhg9PVUz+XoZ
 xw0S7YNuT4JqFTcAkYOb2foP0TwuHYX6AA7ZGk6iP/4py2UDcAe0zuEOlM185QAB/s2Lek
 rIvJKdfMkjbplnGlUaEDQIQAFASv6kc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623321255;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tYnA8/ChtbCNTU9iNRu/Sa2Xnq/9VhGFMBLetvg4Haw=;
 b=7zkI+tdEGNnZMrnJHiGJW+8Fc95YFIAbrJSpbQnxai++ujGS0pw03UXcqGoFD8c0DoAkCl
 /Bo8Fjt3j0wGmBDg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 2rlpEafqwWDpYAAALh3uQQ
 (envelope-from <cfontana@suse.de>); Thu, 10 Jun 2021 10:34:15 +0000
Subject: Re: [PATCH 0/4] modules: add support for target-specific modules.
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210610101553.943689-1-kraxel@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <4a1a23af-461f-92c4-d9f0-1f8133d611db@suse.de>
Date: Thu, 10 Jun 2021 12:34:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210610101553.943689-1-kraxel@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, jose.ziviani@suse.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 12:15 PM, Gerd Hoffmann wrote:
> Based on the "modules: add metadata database" patch series sent
> earlier today.  Adds support for target-specific modules to the
> module code and build infrastructure.  Builds one simple module
> (virtio-9p-device) for testing purposes.  Well, one module per
> target to be exact ;)
> 
> Gerd Hoffmann (4):
>   modules: factor out arch check
>   modules: check arch on qom lookup
>   modules: target-specific module build infrastructure
>   modules: build virtio-9p modular
> 
>  hw/9pfs/virtio-9p-device.c |  2 ++
>  util/module.c              | 30 ++++++++++++++++++++++++------
>  hw/9pfs/meson.build        | 11 ++++++++++-
>  meson.build                | 26 ++++++++++++++++++++++++++
>  4 files changed, 62 insertions(+), 7 deletions(-)
> 

Very interesting, Cc:ing also Philippe on this.

Thanks!

CLaudio


