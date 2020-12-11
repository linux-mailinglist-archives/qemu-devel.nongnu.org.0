Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7624E2D7442
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 11:55:32 +0100 (CET)
Received: from localhost ([::1]:56000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kng5D-0001ya-Gs
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 05:55:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>) id 1kng3y-0001WX-4t
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 05:54:14 -0500
Received: from mail.csgraf.de ([188.138.100.120]:51862
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>) id 1kng3v-0000my-8W
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 05:54:13 -0500
Received: from Alexanders-MacBook-Air.local
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with ESMTPSA id 4689339001AD;
 Fri, 11 Dec 2020 11:54:07 +0100 (CET)
Subject: Re: [PATCH v5 6/7] tcg: implement JIT for iOS and Apple Silicon
To: Joelle van Dyne <j@getutm.app>
References: <20201108232425.1705-1-j@getutm.app>
 <20201108232425.1705-7-j@getutm.app>
 <6fb788c8-ac2b-83b6-8977-24652a05f7c5@csgraf.de>
 <CA+E+eSAznXzHD1u+a+X4kenbOzfEifzznXx0Qq6425ahjK7K_Q@mail.gmail.com>
 <781d6412-ff8a-ae33-3b00-d27e9fc9cd0a@csgraf.de>
 <CA+E+eSBf957VZ56HAOmK8dYJRrySjEJkNVCrzHZxUF81M4Gycg@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <37faedcb-5431-5f4c-b8b5-5dbe94510ae2@csgraf.de>
Date: Fri, 11 Dec 2020 11:54:06 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CA+E+eSBf957VZ56HAOmK8dYJRrySjEJkNVCrzHZxUF81M4Gycg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 25.11.20 03:08, Joelle van Dyne wrote:
> A lot of users of UTM are on iOS 13 (a large number of devices only
> have jailbreak for iOS 13 and below), but if the QEMU community thinks
> it's better that way, we are willing to compromise.


I think it would make merging much more straight forward if we could 
keep RWX toggling to the publicly released API. So yes, please adapt it. 
In UTM, you can still carry a tiny downstream patch that implements the 
API through your reverse engineered code for iOS 13, no?


Alex



