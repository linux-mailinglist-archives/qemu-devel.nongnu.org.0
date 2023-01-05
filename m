Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9841E65F337
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:54:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDUQk-00085Q-Kg; Thu, 05 Jan 2023 12:53:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1pDUQi-00084C-63; Thu, 05 Jan 2023 12:53:28 -0500
Received: from fanzine2.igalia.com ([213.97.179.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1pDUQg-0003c4-Bx; Thu, 05 Jan 2023 12:53:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Message-ID:Date:References:
 In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=effzz8o0cRBWHINbGOdU57z1klkaYGMYxBMz7PtgISk=; b=lsEA6ohgnmXsDZ++FB0uYRd8CS
 2X4Rwgl/d2RLsvKTcRG1gb76Q/C7j/wbNnpD3tlQDFs55vYnQDTlCfhfA+WM7LLlJMyWbL1JywW+j
 +i1tQcZ/MXVcriMg296wPZeIxLVeXVXrAjv5VMvt/6mjWIAPNM/0wCCOsBBLFnwhcvHeKVNBsVoM/
 XBXOGcxpTteBzVIAhj0C0Z0GG+C7XoHXtoAUjASdnKGR4/M1Z02SlbBY2PjOyycJFLij24yxhyvyN
 NwaHCktg8OwzbfB3RQnAaHjet/eaaqm/zR6O+k775eAXl4YbW0vKN4hwzVXkCUX+jvyFAc2QbLTW2
 1tpAzphg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pDTuD-000EeP-UB; Thu, 05 Jan 2023 18:19:53 +0100
Received: from gate.service.igalia.com ([192.168.21.52])
 by mail.igalia.com with esmtp (Exim)
 id 1pDTuB-00H9IF-QF; Thu, 05 Jan 2023 18:19:53 +0100
Received: from berto by gate.service.igalia.com with local (Exim 4.94.2)
 (envelope-from <berto@igalia.com>)
 id 1pDTuB-00Dt7B-7W; Thu, 05 Jan 2023 17:19:51 +0000
From: Alberto Garcia <berto@igalia.com>
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org, Kevin Wolf
 <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] tests/qemu-iotests/312: Mark "quorum" as required driver
In-Reply-To: <20230104114601.269351-1-thuth@redhat.com>
References: <20230104114601.269351-1-thuth@redhat.com>
Date: Thu, 05 Jan 2023 17:19:51 +0000
Message-ID: <w51v8lk291k.fsf@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=213.97.179.56; envelope-from=berto@igalia.com;
 helo=fanzine2.igalia.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed 04 Jan 2023 12:46:01 PM +01, Thomas Huth wrote:
> "quorum" is required by iotest 312 - if it is not compiled into the
> QEMU binary, the test fails. Thus list "quorum" as required driver
> so that the test gets skipped in case it is not available.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

