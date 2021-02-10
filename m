Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC93316E45
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 19:16:39 +0100 (CET)
Received: from localhost ([::1]:37620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9u2Y-0002s9-Ig
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 13:16:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1l9u0R-0002Pc-EW
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 13:14:27 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1l9u0P-000170-1x
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 13:14:27 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11AI3rx7047785
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 13:14:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=3u0tQfmenx5REi16ZeNcKFTKVgav5PqPY6ql4+Antgk=;
 b=C0w/1vZfZzk/7YltVPfbzWuO3GYZdXBtDvTXNZokh7rYnwFRkcugYqc68JoiHwiNHH8q
 XHylO22fLVbOSYYisxaLsXjv0zzqtAc5S8+pBnH1AhO6VtI5vsMyy9vZMrll4qAHM8LA
 p+7YICzLFmerRSQQGcwAcbMPYhFNmi5ijU/F0jvpz2RKEnxrs++x3bqtyMx6oBVu0JYx
 dknIdlgGXoEZ9U30lTi2+o/b9SN3uIz0zzBrd2BqgkO/Dliwr8sOryYOhBr+0DZ4qcqy
 uKYZD8SGGkZuIiW2dFlHyes3/eNi8US5j1nXo4dESo/dZtOQ0Elv1eMj2PUhyNpsY1mH Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36mm4m0yvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 13:14:22 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11AI4MHw049539
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 13:14:21 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36mm4m0yv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Feb 2021 13:14:21 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11AID9Z1002993;
 Wed, 10 Feb 2021 18:14:21 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 36hjr9fxur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Feb 2021 18:14:21 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11AIEJtm13828600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Feb 2021 18:14:19 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D36517805F;
 Wed, 10 Feb 2021 18:14:19 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2B6E7805C;
 Wed, 10 Feb 2021 18:14:18 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.80.218.10])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 10 Feb 2021 18:14:18 +0000 (GMT)
Message-ID: <ac1a5075878d86b0a46db20cb6e579b5fec74d87.camel@linux.ibm.com>
Subject: Re: Interactive launch over QMP socket?
From: James Bottomley <jejb@linux.ibm.com>
To: Connor Kuehl <ckuehl@redhat.com>, qemu-devel@nongnu.org
Date: Wed, 10 Feb 2021 10:14:17 -0800
In-Reply-To: <47b15088-514a-8174-029d-8d9c4571960a@redhat.com>
References: <47b15088-514a-8174-029d-8d9c4571960a@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-10_06:2021-02-10,
 2021-02-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102100161
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jejb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: jejb@linux.ibm.com
Cc: npmccallum@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2021-02-10 at 12:01 -0600, Connor Kuehl wrote:
> Hello,
> 
> Does QEMU have an internal API which would allow VM construction to
> wait at a *very specific point* until specific data/QMP message(s)
> are supplied via the QMP socket?

Yes, the -S flag tells qemu to pause before starting the VM but after
setting it up.  It's the flag I use for SEV.

> For some additional context: QEMU supports launching AMD SEV-
> protected guests; in short: encrypted virtual machines. Guest owners
> may participate in attestation to cryptographically verify their
> assumptions about the guest's initial state, the host's platform, and
> the host platform owner's identity. If the guest owner is satisfied
> with the attestation process, a secret can be safely injected into
> the guest's address space over a secure channel.
> 
> Attestation is an unavoidably interactive process.
> 
> It appears that QEMU already exposes most of the API required to
> perform this attestation remotely with a guest owner over QMP, with
> only one exception: starting the attestation session. It looks like
> the session  components (policy, session-file, and dh-cert-file) are
> supplied via command line arguments to QEMU and don't have a message
> type in the QMP spec:
> 
> 	-object 
> sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1,policy=0x1,session-
> file=blah.session,dh-cert-file=guest_owner.cert
> 
> I would like to add a message type to QMP which allows guest owners
> to supply this data over a socket and _not_ require these components
> a priori via command line arguments. In doing so, this would allow
> for a 100% remote attestation process over the socket. However, I'm
> not sure how to express this interactive "waiting" for this data to
> become available with internal APIs (assuming it's not supplied as a
> command  line argument).

Well, I never understood why qemu can't deduce the value of cbitpos ...
it even errors out if you get it wrong.  However, other things like the
policy and the session file have to be present at start of day. 
They're not things that can be passed in after qemu starts building the
machine image because they need to be present to begin building it.

> For example, in order to accomplish a 100% remote attestation:
> 
> Somewhere in between sev_guest_init() and sev_launch_start(), the
> guest owner may send the following messages:
> 
> 1. "query-sev" to collect important information about the platform
> state
> 
> 2. "query-sev-capabilities" to independently verify the platform 
> certificate chain and derive a shared secret for establishing a
> secure channel with the AMD SP.
> 
> 3. "sev-launch-start" this is the only message that I think is
> missing from the QMP message types for remote attestation. This is
> how the guest owner would deliver the session components over the
> socket instead of as command line arguments.

The patch for remote attestation (which was only recently added to the
PSP protocol) is here:

https://lore.kernel.org/kvm/20210105163943.30510-1-brijesh.singh@amd.com/

> Then, sometime before the VM is launched and is running, the guest
> owner may send:
> 
> 4. "query-sev-launch-measure" to compare its measurement against the
> AMD SP's measurement
> 
> 5. "sev-inject-launch-secret" if happy with attestation, securely 
> deliver secrets
> 
> 6. Guest owner could send a "cont" command and the VM can launch
> 
> Any advice on how to accomplish adding this degree of interaction to 
> supplying inputs to specific parts of the launch process this is
> greatly appreciated.

I've attached the python script I use to launch sev guests.  However,
it doesn't include the launch bundle because that has to have already
been passed in when qemu was started.

James

---
#!/usr/bin/python3
##
# Python script to inject a secret disk password into a paused SEV VM
#  (to pause the VM start with -S option)
#
# This assumes you've already created the launch bundle using sev-tool
# from https://github.com/AMDESE/sev-tool.git
#
# sev-tool --generate_launch_blob
#
# creates several files, the only one this script needs is the TIK and TEK
# keys which are stored in tmp_tk.bin
#
# Once TIK/TEK are known, the script will probe the VM for the sev
# parameters needed to calculate the launch measure, retrieve the launch
# measure and verify against the measure calculated from the OVMF hash
# and if that matches create the secret bundle and inject it
#
# Tables and chapters refer to the amd 55766.pdf document
#
# https://www.amd.com/system/files/TechDocs/55766_SEV-KM_API_Specification.pdf
##
import sys
import os 
import base64
import hmac
import hashlib
from argparse import ArgumentParser
from uuid import UUID
from Crypto.Cipher import AES
from Crypto.Util import Counter
from git.qemu.python.qemu import qmp

if __name__ == "__main__":
    parser = ArgumentParser(description='Inject secret into SEV')
    parser.add_argument('--tiktek-file',
                        help='file where sev-tool stored the TIK/TEK combination, defaults to tmp_tk.bin',
                        default='tmp_tk.bin')
    parser.add_argument('--passwd',
                        help='Disk Password',
                        required=True)
    parser.add_argument('--ovmf-hash',
                        help='hash of OVMF firmware blob in hex')
    parser.add_argument('--ovmf-file',
                        help='location of OVMF file to calculate hash from')
    parser.add_argument('--socket',
                        help='Socket to connect to QMP on, defaults to localhost:6550',
                        default='localhost:6550')
    args = parser.parse_args()

    if (args.ovmf_file):
        fh = open (args.ovmf_file, 'rb')
        h = hashlib.sha256(fh.read())
        ovmf_hash = h.digest()
    elif (args.ovmf_hash):
        ovmf_hash = bytearray.fromhex(args.ovmf_hash)
    else:
        parser.error('one of --ovmf-hash or -ovmf-file must be specified')

    if (args.socket[0] == '/'):
        socket = args.socket
    elif (':' in args.socket):
        s = args.socket.split(':')
        socket = (s[0], int(s[1]))
    else:
        parse.error('--socket must be <host>:<port> or /path/to/unix')

    fh=open(args.tiktek_file, 'rb')
    tiktek=bytearray(fh.read())
    fh.close()

    ##
    #  tiktek file is just two binary aes128 keys
    ##
    TEK=tiktek[0:16]
    TIK=tiktek[16:32]

    disk_secret = args.passwd

    Qmp = qmp.QEMUMonitorProtocol(address=socket);
    Qmp.connect()
    caps = Qmp.command('query-sev')
    print('SEV query found API={api-major}.{api-minor} build={build-id} policy={policy}'.format(**caps))
    h = hmac.new(TIK, digestmod='sha256');

    ##
    # calculated per section 6.5.2
    ##
    h.update(bytes([0x04]))
    h.update(caps['api-major'].to_bytes(1,byteorder='little'))
    h.update(caps['api-minor'].to_bytes(1,byteorder='little'))
    h.update(caps['build-id'].to_bytes(1,byteorder='little'))
    h.update(caps['policy'].to_bytes(4,byteorder='little'))
    h.update(ovmf_hash)

    print('\nGetting Launch Measurement')
    meas = Qmp.command('query-sev-launch-measure')
    launch_measure = base64.b64decode(meas['data'])

    ##
    # returned data per Table 52. LAUNCH_MEASURE Measurement Buffer
    ##
    nonce = launch_measure[32:48]
    h.update(nonce)
    measure = launch_measure[0:32]

    print('Measure:   ', measure.hex())
    print('should be: ', h.digest().hex())
    print('')

    if (measure != h.digest()):
        sys.exit('Measurement doesn\'t match')

    print('Measurement matches, Injecting Secret')

    ##
    # construct the secret table: two guids + 4 byte lengths plus string
    # and zero terminator
    #
    # Secret layout is  guid, len (4 bytes), data
    # with len being the length from start of guid to end of data
    #
    # The table header covers the entire table then each entry covers
    # only its local data
    #
    # our current table has the header guid with total table length
    # followed by the secret guid with the zero terminated secret 
    ##
    
    # total length of table: header plus one entry with trailing \0
    l = 16 + 4 + 16 + 4 + len(disk_secret) + 1
    # SEV-ES requires rounding to 16
    l = (l + 15) & ~15
    secret = bytearray(l);
    secret[0:16] = UUID('{1e74f542-71dd-4d66-963e-ef4287ff173b}').bytes_le
    secret[16:20] = len(secret).to_bytes(4, byteorder='little')
    secret[20:36] = UUID('{736869e5-84f0-4973-92ec-06879ce3da0b}').bytes_le
    secret[36:40] = (16 + 4 + len(disk_secret) + 1).to_bytes(4, byteorder='little')
    secret[40:40+len(disk_secret)] = disk_secret.encode()
    
    ##
    # encrypt the secret table with the TEK in ctr mode using a random IV
    ##
    IV=os.urandom(16)
    # -EKNUCKLEHEADS in python crypto don't understand CTR mode
    e = AES.new(TEK, AES.MODE_CTR, counter=Counter.new(128,initial_value=int.from_bytes(IV, byteorder='big')));
    encrypted_secret = e.encrypt(bytes(secret))

    ##
    # ultimately needs to be an argument, but there's only
    # compressed and no real use case
    ##
    FLAGS = 0

    ##
    # Table 55. LAUNCH_SECRET Packet Header Buffer
    ##
    header=bytearray(52);
    header[0:4]=FLAGS.to_bytes(4,byteorder='little')
    header[4:20]=IV
    h = hmac.new(TIK, digestmod='sha256');
    h.update(bytes([0x01]))
    # FLAGS || IV
    h.update(header[0:20])
    h.update(l.to_bytes(4, byteorder='little'))
    h.update(l.to_bytes(4, byteorder='little'))
    h.update(encrypted_secret)
    h.update(measure)
    header[20:52]=h.digest()

    Qmp.command('sev-inject-launch-secret',
                **{'packet-header': base64.b64encode(header).decode(),
                   'secret': base64.b64encode(encrypted_secret).decode()
                })

    print('\nSecret Injection Successful, starting VM')

    Qmp.command('cont')



