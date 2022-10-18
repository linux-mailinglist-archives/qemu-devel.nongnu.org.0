Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB2C602B68
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 14:13:10 +0200 (CEST)
Received: from localhost ([::1]:47010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oklT2-0000R1-3a
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 08:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oklBw-00084V-Sr
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 07:55:29 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:38015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oklBi-0002yf-Aa
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 07:55:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=51pI383kLIOgNqBf4bVO/jweqafukty0hmgNo4caaYc=; b=w52Eyvwle1RQDCgUncLwosAJ6b
 8EkIVFqprL6isnOjvel+8oBXbBdUqH8ZHjrncbkr+6969aoV6fTA/VBl+7I9OJ8kKw0Y/+amNBZQh
 S9d5reqoRxL1UVkLBlHeU82MnMXbdRCbTXxo9C6+M+LVlupRiK0EXLv4Tnt+7rqFMP8/27eR0Um4+
 eGkNkIya2WN65JqFHZ+sWHk/uWbCX6yq3TPb5nROTqp+fwIrdV+UxZrNQlJqIY9b6wm9FVSlEAHb8
 RrZQY6r97AoXLxdkIsY2DaOspS3EAUReL30P/rVAzUBQq6HxamGNpv/F2Tmz8FKqgVWHVo9kqKwfh
 FzB7J5oawJX4Woxw2pT2l+2virhlEA2zFJ0vYyaP++o//47vlPIKGOgV5dJWOwHcg8IF8sz29NbDq
 wyqM7G4ZfcxItt1NVWYEvE1K6WIk6/uX83msPwPU2eamuBNdICzH/3UKhfOqdjTkzrkDmYKX5bI+Y
 9nZLmO45l7PgVU2okNKO1Dn4LEYFio431K4uhIbKOnGgzBGb8gHQZX2FlnpFr1ppG9VkxnrNHRp/H
 LlU9lHeBGJwLlWyPaEwmNjW7x6dSOIrd/NdtQyAREAnzb3AFHekrbPreyJRpSr1Fj6vOU1eHODgAm
 vUz2IINvgOJmz46yF0W0gi3QSRF0KgY10azofl1fQ=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 00/20] tests/9p: introduce declarative function calls
Date: Tue, 18 Oct 2022 13:54:58 +0200
Message-ID: <1813122.qVG7zHTq9q@silver>
In-Reply-To: <cover.1664917004.git.qemu_oss@crudebyte.com>
References: <cover.1664917004.git.qemu_oss@crudebyte.com>
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

On Tuesday, October 4, 2022 10:56:44 PM CEST Christian Schoenebeck wrote:
> This series converts relevant 9p (test) client functions to use named
> function arguments. For instance
> 
>     do_walk_expect_error(v9p, "non-existent", ENOENT);
> 
> becomes
> 
>     twalk({
>         .client = v9p, .path = "non-existent", .expectErr = ENOENT
>     });
> 
> The intention is to make the actual 9p test code more readable, and easier
> to maintain on the long-term.
> 
> Not only makes it clear what a literal passed to a function is supposed to
> do, it also makes the order and selection of arguments very liberal, and
> allows to merge multiple, similar functions into one single function.
> 
> This is basically just refactoring, it does not change behaviour.

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

Next 9p PR end of this week.

Best regards,
Christian Schoenebeck




