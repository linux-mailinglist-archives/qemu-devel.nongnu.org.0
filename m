Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64678295FA3
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 15:19:13 +0200 (CEST)
Received: from localhost ([::1]:56642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVaUq-00045z-GP
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 09:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1kVaPG-00085q-1m
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 09:13:27 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:58782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1kVaP8-00022R-IN
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 09:13:23 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09MDAEJ9163449;
 Thu, 22 Oct 2020 13:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=rUccZpMrHXogrCdNKE9nh8zuo2uuBUW0Z1aY+vKPcvg=;
 b=qYU/TZolKGdVRV0kF9zYF3by5k15MDJR9ofBbm/ubzgvnz00QFmdf9fHJ4kHrwzNZcd0
 D/moQuPsURReyeuyiVVmHgpMNb3eKSyF6TLOatddwPLp/3yzw5+yn971uQq8I95eQurI
 Z3/HOCyF5dNrzD6u+cCq06MHHv4WCd1i6xCUTGY2x+M2w3VWlhfWL+4X/L6bby8+dp9U
 Z8ZVRN2v2C/Dbijsv8sog5qqC6PPazsp+nvv8Cu3eha0CEVMhkc/mrwhOxXjoJDN97AV
 HTMj3TDVj05BlfMyX2Y+20UH9C3PL7gH4g4gbGcVRkbynETKL+w4c3W3Bd8IDsoKhgD4 Yg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 34ak16p401-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 22 Oct 2020 13:13:15 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09MDA9cZ113718;
 Thu, 22 Oct 2020 13:13:14 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 348a6qjyj9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Oct 2020 13:13:14 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09MDDCnZ029210;
 Thu, 22 Oct 2020 13:13:12 GMT
Received: from starbug-mbp.localdomain (/79.97.215.145)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 22 Oct 2020 06:13:11 -0700
Received: by starbug-mbp.localdomain (Postfix, from userid 501)
 id C60ED1D7B307; Thu, 22 Oct 2020 14:13:09 +0100 (IST)
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [PATCH v6 16/16] scripts/oss-fuzz: remove the generic-fuzz target
In-Reply-To: <20201022130123.5bjijh5cupwujeox@mozz.bu.edu>
References: <20201021210922.572955-1-alxndr@bu.edu>
 <20201021210922.572955-17-alxndr@bu.edu> <m2o8ku7ghw.fsf@oracle.com>
 <20201022130123.5bjijh5cupwujeox@mozz.bu.edu>
Date: Thu, 22 Oct 2020 14:13:09 +0100
Message-ID: <m2eelq76ai.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9781
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=904
 bulkscore=0 spamscore=0 adultscore=0 suspectscore=2 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010220089
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9781
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=913
 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010220089
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=darren.kenny@oracle.com; helo=userp2120.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 09:13:17
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, f4bug@amsat.org,
 bsd@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 dimastep@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thursday, 2020-10-22 at 09:01:23 -04, Alexander Bulekov wrote:
> On 201022 1032, Darren Kenny wrote:
>> Hi Alex,
>> 
>> On Wednesday, 2020-10-21 at 17:09:22 -04, Alexander Bulekov wrote:
>> > generic-fuzz is not a standalone fuzzer - it requires some env variables
>> > to be set. On oss-fuzz, we set these with some predefined
>> > generic-fuzz-{...} targets, that are thin wrappers around generic-fuzz.
>> > Remove generic-fuzz from the oss-fuzz build, so oss-fuzz does not treat
>> > it as a standalone fuzzer.
>> >
>> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
>> > ---
>> >  scripts/oss-fuzz/build.sh | 6 ++++++
>> >  1 file changed, 6 insertions(+)
>> >
>> > diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
>> > index 0c3ca9e06f..37cd7f9e25 100755
>> > --- a/scripts/oss-fuzz/build.sh
>> > +++ b/scripts/oss-fuzz/build.sh
>> > @@ -97,5 +97,11 @@ do
>> 
>
> Hi Darren,
>
>> I'm presuming that the target that you're removing is being created by
>> this line, maybe we should just specifically skip it here instead?
>
> Sounds good.
>
>> The comment below on the removal probably would still apply though.
>> 
>> >      cp qemu-fuzz-i386 "$DEST_DIR/qemu-fuzz-i386-target-$target"
>> 
>> Also, did you look into using hard-links, or even sym-links - they would
>> require less duplication of the binaries, which may be important, or may
>> not, and quicker creation too, e.g.
>> 
>>       ln qemu-fuzz-i386 "$DEST_DIR/qemu-fuzz-i386-target-$target"
>
> This is what I tried, when I was putting together the patch-series, and
> it raised an error when I was testing it in the oss-fuzz
> docker-containers. I blamed it on Docker, originally, but I just took a
> closer look, and the problem was that "qemu-fuzz-i386" isn't on the same
> file-system as $DEST_DIR in the oss-fuzz Docker. If I copy
> qemu-fuzz-i386 to $DEST_DIR/lib, and do 
>     ln "$DEST_DIR/lib/qemu-fuzz-i386" \
>        "$DEST_DIR/qemu-fuzz-i386-target-$target"
> everything works :)

Fair enough then!

Thanks,

Darren.

> Thanks
> -Alex
>
>> 
>> It's something that has been done for years, for example if you do:
>> 
>>       ls -il /sbin/{e2fsck,fsck.ext*}
>> 
>> you will see they share the same inode. Similarly for vi and ex, they
>> use symlinks (hardlinks on some OSes, but seems not Linux):
>> 
>>       ls -il /bin/{vi,ex}
>> 
>> The main point is that argv[0] will be the name of link itself, not the
>> thing pointed to.
>> 
>> Thanks,
>> 
>> Darren.
>> 
>> >  done
>> >  
>> > +# Remove the generic-fuzz target, as it requires some environment variables to
>> > +# be configured. We have some generic-fuzz-{pc-q35, floppy, ...} targets that
>> > +# are thin wrappers around this target that set the required environment
>> > +# variables according to predefined configs.
>> > +rm "$DEST_DIR/qemu-fuzz-i386-target-generic-fuzz"
>> > +
>> >  echo "Done. The fuzzers are located in $DEST_DIR"
>> >  exit 0
>> > -- 
>> > 2.28.0

