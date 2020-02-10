Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 952261570F6
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Feb 2020 09:46:38 +0100 (CET)
Received: from localhost ([::1]:58352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j14iD-0007g3-8I
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 03:46:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39261)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1j14hM-0007GL-3l
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 03:45:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1j14hL-00017K-30
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 03:45:44 -0500
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:44004)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1j14hK-00015a-W2
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 03:45:43 -0500
Received: by mail-qk1-x734.google.com with SMTP id p7so754717qkh.10
 for <qemu-devel@nongnu.org>; Mon, 10 Feb 2020 00:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=JWe3G04TuLn1M1+mV3Cx77cHAqdXOJqxpN/dmzi1Me0=;
 b=PMe0QCcpi4LXz5CZApQr4Q7CzQDJgWfQaTGhtm/V72MWbcmxbHQqgw1KjWLCEnXyLL
 rsD2lZykfisThF9/n8MrkhF1YWaph4S6ZZ51luZeQI48aDgbuCRrMFUgyQ4QK6GbvP8d
 YjNlwr/fNmBBs5A8XxMeU9RpaukaQH3qr1+rE82sTO19v6ZwQ51l4F8+GVUKOH9pptLi
 SeJY3XdmCoh/364wIBpWwGL5DUPZXlwegy2F49HBNxrPnsaQM5W5MGNAKP26RzBArfkU
 brP/C7JOjAFz30UKqxQePr0AIlbUEVxWVtuhUx8fnMgyoHjJ7IAz1L4ggm9h7h9YqW8E
 KmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JWe3G04TuLn1M1+mV3Cx77cHAqdXOJqxpN/dmzi1Me0=;
 b=WQuiqAWNYiBpE0y+1Lm0s6Dr/NXPHA7X7+CK9QdkET+sUEhNgocDhTsMYx33+nHR3f
 gv8nd23GaqbxPE5seo97CQz2xxtTVZXPiD5qrr37+VJ+VuFweIjjPvaZ5QLVqbpq4XTm
 3EZz78E4N/4nNKxpT6eC1jD4v+bisl95u1eBfKvP15eL8sh2tCJlTTnJqvbDomUhoi+F
 dZ+xObmP0RF6mZplFQJlEILS9zCsUIxItK3XiAn8BhS/Tge6OHoIAyWSy7ReWWlBO6hL
 6zQFsu/wyJbPDQfqG9fLm5FGWXuth9LRx/ksoYZhaqDhU98u/8uIZ6mV/GNKgbb0PllF
 7PUg==
X-Gm-Message-State: APjAAAUODM03M0mZ6Nv1ibllvm60RmmChoddqSrMJ+cP1Hu7U8dB6lJL
 hobQTAtBSxbdUPyZPLuIUvDBnhsSS8aIFb8q7Vk1vhoQbvQXEw==
X-Google-Smtp-Source: APXvYqy0l8Q9YHyoY8BL/Vr6y+SoveLGCQg5TY0RCipEPJLu0X38N0gredc4Vygca6fuvLnge0MllnxJwhZIyiZWAos=
X-Received: by 2002:a05:620a:1014:: with SMTP id
 z20mr351138qkj.196.1581324339157; 
 Mon, 10 Feb 2020 00:45:39 -0800 (PST)
MIME-Version: 1.0
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 10 Feb 2020 08:45:28 +0000
Message-ID: <CAJSP0QWxEh0Feb_FPuMdhajA-6mPcrXX3iBqZL73tQb78CPryQ@mail.gmail.com>
Subject: QEMU Outreachy internship applications now open!
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::734
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dear QEMU community,
Internship applications are now open for a 12-week, full-time, paid,
remote work internship generously sponsored by Red Hat:

https://www.outreachy.org/apply/project-selection/#qemu

The Outreachy open source internship program accepts applicants who
face under-representation, systemic bias, or discrimination in the
technology industry.  Full details on eligibility are available here:
https://www.outreachy.org/docs/applicant/#eligibility

Please take a look if you'd like to apply or pass the link on to
friends who may be interested.

Stefan

