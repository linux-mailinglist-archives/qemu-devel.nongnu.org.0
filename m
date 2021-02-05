Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B52310D7D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:57:57 +0100 (CET)
Received: from localhost ([::1]:39744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l83Ua-0004WA-3e
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:57:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l83TO-0003t3-1x
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:56:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l83TM-0000LD-HS
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:56:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612540599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lsfp5eai/xdafU661E9yKKkJo33OSM6UK/Eov4770aE=;
 b=bKTX3cnfjQ4Nq4wyqUNYNqvDSid9EwGiiRS7ETr8oI0rkSeqh932FQvl2mKwwPiuX7fbfY
 layAiQoKEfwdUpeVNfrnGoY6M/jeUiACBFHyytEo6dYaS4RVDmD1yV0/8H/e5kyXItSTZ9
 KCfT/ue+3wAPrIN+B8K2qOtaZWml8HU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-71RXd6DhMmiWUtJ1pVUnMA-1; Fri, 05 Feb 2021 10:56:37 -0500
X-MC-Unique: 71RXd6DhMmiWUtJ1pVUnMA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8460E801965;
 Fri,  5 Feb 2021 15:56:36 +0000 (UTC)
Received: from localhost (unknown [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D89825D9CC;
 Fri,  5 Feb 2021 15:56:34 +0000 (UTC)
Date: Fri, 5 Feb 2021 16:56:32 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3] machine: add missing doc for memory-backend option
Message-ID: <20210205165632.7c623d4f@redhat.com>
In-Reply-To: <1db4ec5d-4cd1-ea67-d414-07565c4ee70e@redhat.com>
References: <20210121161504.1007247-1-imammedo@redhat.com>
 <1db4ec5d-4cd1-ea67-d414-07565c4ee70e@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, pkrempa@redhat.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Feb 2021 13:21:32 +0100
Michal Privoznik <mprivozn@redhat.com> wrote:

> On 1/21/21 5:15 PM, Igor Mammedov wrote:
>  >  
> 
> Ping, please? Is there anything I can help with to get this merged? 
> Libvirt's migration is broken without this patch [1] and thus I'd like 
> to have this merged sooner rather than later.

it's a part of 
  [PULL v3 00/38] Misc patches (buildsys, i386, fuzzing) for 2021-01-29


> 
> 1: There's a libvirt patch required but depends on this one.
> 
> Thanks,
> Michal


