Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593D428153B
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 16:32:29 +0200 (CEST)
Received: from localhost ([::1]:58352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOM6m-0006zS-Dz
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 10:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kOM4k-0005mJ-DX
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:30:22 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:41165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kOM4i-0002v2-3s
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:30:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=zL3ZhINMzah40/bysuxOXwjKOBsEBq0Tg8PA6cHlV48=; b=oE/gIV82gHZihhjXvmidNfq6Dq
 sNRQPJu5cwsCtkbCWZurtEjIwV4l7SuMMpxOJmapzlwzIxtM0oJtCN14YygG1GkRaMXS6jESaKzw+
 ev30yp0dfymqXnfWzaigDC0+SBUH/oKPXryOIIAp9TQY7+Y8uGbYE8iPcODvXdeZav7DcDTV/BYLR
 9qkrA5OQfWhN+DiRw8WhYYhkk0NlHV8kmnJXI21dN2eDKoHcB8ONnnrovHXFsNs3BTFmDEXUvjCnd
 7DOnOaDE0AGY0BoJ5nYUK8sROmnku6hB1MunMnypsDw/Rw+G3vKSvbVMr4Xia2MqMSjzvRYjkKD8k
 1ScidkeA==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 11/11] tests/9pfs: add local Tmkdir test
Date: Fri, 02 Oct 2020 16:30:17 +0200
Message-ID: <6486076.Ap9L6znzn6@silver>
In-Reply-To: <20201002142331.GF2338114@redhat.com>
References: <cover.1601639563.git.qemu_oss@crudebyte.com>
 <2008745.A24TOvDVlx@silver> <20201002142331.GF2338114@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 08:18:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Freitag, 2. Oktober 2020 16:23:31 CEST Daniel P. Berrang=E9 wrote:
> No need to realloate a new array - just shuffle down the elements in
> the array you get back from g_strsplit to discard the empty ones. Sure
> the array will end up with a series of NULLs at the end but that is
> harmless.
>=20
> both g_strsplit/g_strfreev work in terms of a normal allocated "char **"
> array, so there's no risk of changes to way memory is allocated.

Ok then, if you say so ... fine with me.

Best regards,
Christian Schoenebeck



