Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F37487B22
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:13:07 +0100 (CET)
Received: from localhost ([::1]:54696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5sna-0003r0-CF
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:13:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.hecht@cyberus-technology.de>)
 id 1n5slN-0002LG-Qz
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:10:49 -0500
Received: from www413.your-server.de ([88.198.28.140]:38058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.hecht@cyberus-technology.de>)
 id 1n5skp-0005XG-Rz
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:10:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References;
 bh=Iom3PEGfF0Oi4mR6Et7wQLslf29b7BH1RW+95wbZico=; b=I4sDW6xjrBUF05yX58P3XzAaMM
 J+gsFfxTzatuciMxCUgtsm/rA7X9U06l+14sBm8Cy6fKDzUVKgkLuSFH63LviqH9+bK9nzFnK2ho+
 ZcsjBJ7jaezloaTBkwPaqpH0uIV7r+pvplv24qNoar0VzXZii0QXuTkH2FSvyPEKq2VemtnLjeCns
 TVj/kt4ZdpxYZx4iogpnoBAuD9RHJeXWEyYwne4StwrdjxCwWCjHs1tFl4Dn7+kWWqccRfZg9hnqH
 iODT0P8ogqxo1WCYkU32Bv2Fp31oT3yRORt8UEozvzHWm8vupVkKfhhH+x3mN7ngb5X0BWVfrAqvl
 zn7aMuwA==;
Received: from [78.46.152.42] (helo=sslproxy04.your-server.de)
 by www413.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lucas.hecht@cyberus-technology.de>)
 id 1n5ski-000Exe-IT
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 18:10:08 +0100
Received: from [81.201.150.231] (helo=[10.8.0.11])
 by sslproxy04.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lucas.hecht@cyberus-technology.de>)
 id 1n5ski-000UyB-Fi
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 18:10:08 +0100
To: qemu-devel@nongnu.org
From: Lucas Hecht <lucas.hecht@cyberus-technology.de>
Subject: Wiki: Update package name in build instructions
Message-ID: <6e8852b0-7320-ef7d-18c6-512cabeb71b4@cyberus-technology.de>
Date: Fri, 7 Jan 2022 18:10:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lucas.hecht@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.103.3/26415/Fri Jan  7 10:26:59 2022)
Received-SPF: pass client-ip=88.198.28.140;
 envelope-from=lucas.hecht@cyberus-technology.de; helo=www413.your-server.de
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

Hi there,

could someone please give me a wiki account or make this minor change 
themself:

In the wiki article "Host/Linux" under "Recommended additional packages" 
libvte-2.90-dev should be changed to libvte-2.91-dev since the former is 
not available anymore.

Thanks
Lucas

