Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E2C41E99E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 11:32:08 +0200 (CEST)
Received: from localhost ([::1]:39596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWEtj-0004ls-Gf
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 05:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mWEpy-0002Py-EF
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 05:28:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mWEpu-0002BD-LB
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 05:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633080488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/Fonn+UlzLOVDNbErJ1OGE4MUFe3GDK9Mryhs/gXTmI=;
 b=YKFtkylAIddrUSTkEm3JAhlid4lGE0USHGawmTi9OOV94gy0NB7xTSr7ItEbE9+Z8vBg/l
 EvSuzqkgJLKe9Egt8b8dr7H7epzNBPEbZys+OmczAZWiXUeJG9oGS1e/+A6cRJe5QwvFq/
 xH0DFSJTvB2JrzFiLqdfB1X6aZVbUoA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-j2XiL3YaO4-UjRCRRcSLGg-1; Fri, 01 Oct 2021 05:28:05 -0400
X-MC-Unique: j2XiL3YaO4-UjRCRRcSLGg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53F4F1926DA1
 for <qemu-devel@nongnu.org>; Fri,  1 Oct 2021 09:28:04 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.159])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8907160BF4;
 Fri,  1 Oct 2021 09:28:03 +0000 (UTC)
Date: Fri, 1 Oct 2021 11:28:01 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 0/8] qapi: Add support for aliases
Message-ID: <YVbUoXL96b6tf7rb@redhat.com>
References: <20210917161320.201086-1-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210917161320.201086-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: jsnow@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.09.2021 um 18:13 hat Kevin Wolf geschrieben:
> This series introduces alias definitions for QAPI object types (structs
> and unions).
> 
> This allows using the same QAPI type and visitor even when the syntax
> has some variations between different external interfaces such as QMP
> and the command line.
> 
> It also provides a new tool for evolving the schema while maintaining
> backwards compatibility (possibly during a deprecation period).
> 
> The first user is intended to be a QAPIfied -chardev command line
> option, for which I'll send a separate series. A git tag is available
> that contains both this series and the chardev changes that make use of
> it:
> 
>     https://repo.or.cz/qemu/kevin.git qapi-alias-chardev-v4
> 
> v4:
> - Make sure to keep a defined order of aliases in StackObject.aliases
> - Added patch 4 to allow for better error messages when wildcard aliases
>   provide a second value for a member, which may or may not be consumed
>   elsewhere.
> - Resolve chained aliases only once instead of just checking that they
>   can be resolved while looking for matching aliases, and actually
>   resolving them at the end. This is not only a code simplification, but
>   actually necessary for correct error messages on conflicts.
> - Separate schema.py cleanup patch by Markus ('qapi: Revert an
>   accidental change from list to view object')
> - Fixed alias name checks in the QAPI generator
> - Changed check_path() to avoid modifying its 'path' parameter
> - Some more test cases
> - Coding style fixes
> - Documentation improvements

ping


