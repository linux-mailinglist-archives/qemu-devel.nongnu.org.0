Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA45A4D87DC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 16:14:41 +0100 (CET)
Received: from localhost ([::1]:51572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTmPA-0004rL-F6
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 11:14:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nTmLf-0001nC-8o
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 11:11:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nTmLb-0001v9-Ci
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 11:11:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647270657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u0JBbdA7kyce/NZBES0jzQXzuRQZRDuFZxqyzZ/jyNE=;
 b=YLMW3GT7TNXD+UkMkR9KNf8GKmlrhoRoy9YJkT2JqIY3+2iMpPWRi/03duqL77a7UxPLUM
 JxuavkJjrB2yver97DxzpJXE0WUMwLDSDjYCyk72SwI7TVdj2YXePaivV1fRcvOk8TSoe4
 wXdGu+05/mTpWF4Xo5FpRPQKTo0q0Zs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-hry8vFHEPXKjnZwbfAe7hQ-1; Mon, 14 Mar 2022 11:10:52 -0400
X-MC-Unique: hry8vFHEPXKjnZwbfAe7hQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EEAD2999B2A;
 Mon, 14 Mar 2022 15:10:52 +0000 (UTC)
Received: from paraplu (unknown [10.39.196.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C8834B8D54;
 Mon, 14 Mar 2022 15:10:51 +0000 (UTC)
Date: Mon, 14 Mar 2022 16:10:49 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 2/3] docs: rSTify MailingLists wiki; move it to QEMU Git
Message-ID: <Yi9a+cA5lO+tUfIu@paraplu>
References: <20220314104943.513593-1-kchamart@redhat.com>
 <20220314104943.513593-3-kchamart@redhat.com>
 <a87fc975-ff3b-f7a3-0bb4-9791f2ff3437@gmail.com>
MIME-Version: 1.0
In-Reply-To: <a87fc975-ff3b-f7a3-0bb4-9791f2ff3437@gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pbonzini@redhat.com, thuth@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 14, 2022 at 02:45:30PM +0100, Philippe Mathieu-Daudé wrote:
> Hi Kashyap,

Hi,

> On 14/3/22 11:49, Kashyap Chamarthy wrote:

[...]

> This is a fair conversion from
> https://wiki.qemu.org/Contribute/MailingLists, but a good opportunity to
> improve (could be on top).

Yeah, definitely.  I'll make a TODO to add it on top.  (I didn't wanted
to mix in content edits with conversion changes, as it puts additional
burden on the reviewers.)

> We could sort as:
> 
>  * qemu-discuss
> 
>    Meant for users. Ideally help should point at Documentation link,
>    and in case of missing doc we should add it or at least a GitLab
>    @Documentation ticket.
> 
>  * qemu-devel
> 
>    Meant for developers. "All patches must be sent there".
> 
>    Then developer sub-lists:
> 
>    - qemu-trivial
> 
>    - qemu-stable (this is kinda borderline, security issue fixes should
>      Cc this list, however it has to be treated as a write-only list
>      - a way to tag patches - no discussion happens there).

Nit: The term "kinda boderline" here can mean anything from "its
purpose is questionable" to "it is used for unintended purposes", etc.
Let's avoid vague phrasing in public-facing text.  We can just be
descriptive of what the purpose of the list is. :-)

Thanks for the review!

>    - susbsystem specific
> 
>      > block layer
> 
>      > architecture specific
> 
>        . ARM
>        . PPC
>        . ...

[...]


-- 
/kashyap


